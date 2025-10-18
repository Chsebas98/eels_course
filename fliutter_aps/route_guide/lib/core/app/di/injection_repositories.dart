import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_guide/core/app/bloc/app_bloc.dart';
import 'package:route_guide/core/app/handlers/cubit/permission_cubit.dart';
import 'package:route_guide/packages/data/account/app/check_user_exists.dart';
import 'package:route_guide/packages/data/account/app/get_current_user.dart';
import 'package:route_guide/packages/data/account/app/save_user.dart';
import 'package:route_guide/packages/data/account/domain/user/auth_repository.dart';
import 'package:route_guide/packages/data/account/infraestructure/auth_repository_impl.dart';
import 'package:route_guide/packages/data/account/infraestructure/user_mapper.dart';
import 'package:route_guide/packages/features/maps/bloc/map/maps_bloc.dart';
import 'package:route_guide/packages/features/core/utility/input_converter.dart';
import 'package:route_guide/packages/features/maps/data/repository/maps_repository.dart';
import 'package:route_guide/packages/features/maps/data/repository/maps_repositoryImpl.dart';
import 'package:route_guide/packages/features/onboarding/bloc/on_boarding_bloc.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

// Se crea un Singleton con GetIt para asegurarnos que exista una única instancia de
// una clase en toda la app y que todos los componentes/widgets/blocs accedan a esa misma instancia
// En conclusion evita crear el mismo objeto muchas veces (ahorras memoria/configuración).
// Recursos que pueden ser compartidos: Prefs, Logger, ApiClient, Theme, Database.

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //?App
  //*
  serviceLocator.registerFactory(() => AppBloc(serviceLocator()));
  serviceLocator.registerFactory(() => PermissionCubit());
  //?Core
  //*Utility
  serviceLocator.registerFactory(() => InputConverter());

  //* Account

  serviceLocator.registerLazySingleton(() => SaveUser(serviceLocator()));
  serviceLocator.registerLazySingleton(() => CheckUserExists(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetCurrentUser(serviceLocator()));

  //* Infrastructure
  serviceLocator.registerLazySingleton(() => AuthCache(serviceLocator()));
  serviceLocator.registerLazySingleton(() => const UserMapper());
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator(), serviceLocator()),
  );

  //* Onboarding-Bloc
  serviceLocator.registerFactory(
    () => OnBoardingBloc(serviceLocator(), serviceLocator()),
  );

  //*Maps
  serviceLocator.registerLazySingleton<Dio>(
    () => Dio(/* opciones si necesitas */),
  );

  serviceLocator.registerLazySingleton<MapsRepository>(
    () => MapsRepositoryImpl(
      dio: serviceLocator<Dio>(),
      apiKey: Platform.isAndroid
          ? 'AIzaSyDr9pxI4hVai_BOExTzFKNNwaqnSDaXaK0'
          : 'AIzaSyBFXAuzFIM0S1myFpoFT_Z2Rcdy3Xj1Fzc',
    ),
  );
  serviceLocator.registerFactory(
    () => MapsBloc(
      serviceLocator<MapsRepository>(),
      serviceLocator<AuthRepository>(),
    ),
  );

  //* External
  serviceLocator.registerLazySingleton(() => RxSharedPreferences.getInstance());
}
