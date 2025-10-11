import 'package:get_it/get_it.dart';
import 'package:route_guide/core/app/bloc/app_bloc.dart';
import 'package:route_guide/packages/core/utils/utils.dart';
import 'package:route_guide/packages/data/account/app/check_user_exists.dart';
import 'package:route_guide/packages/data/account/app/get_current_user.dart';
import 'package:route_guide/packages/data/account/app/save_user.dart';
import 'package:route_guide/packages/data/account/domain/user/auth_repository.dart';
import 'package:route_guide/packages/data/account/infraestructure/auth_repository_impl.dart';
import 'package:route_guide/packages/data/account/infraestructure/user_mapper.dart';
import 'package:route_guide/packages/features/onboarding/bloc/on_boarding_bloc.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //?App
  //*
  serviceLocator.registerFactory(() => AppBloc(serviceLocator()));
  //?Core
  //*Utility
  serviceLocator.registerFactory(() => InputConverter());

  //? Data - Service
  //*Generales
  // sl.registerLazySingleton(() => const AskGpsAccess());
  // sl.registerLazySingleton(() => const CheckPermissionGranted());
  // sl.registerLazySingleton(() => const GpsCurrentStatus());
  // sl.registerLazySingleton(() => const GpsInitialStatus());
  // sl.registerLazySingleton(() => const OpenAppSettings());
  // sl.registerLazySingleton(() => const GetCurrentPosition());
  // sl.registerLazySingleton(() => const GetPositionStream());

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

  //* Application
  // sl.registerLazySingleton(() => GetRoutes(sl()));
  // sl.registerLazySingleton(() => SearchPlaces(sl()));
  // sl.registerLazySingleton(() => GetPlace(sl()));
  // //* Domain
  // sl.registerLazySingleton<TrafficService>(
  //     () => TrafficServiceImpl(sl(), sl()));
  // sl.registerLazySingleton<PlacesService>(() => PlacesServiceImpl(sl(), sl()));
  // //* Infrastructure
  // sl.registerLazySingleton(() => const TrafficMapper());
  // sl.registerLazySingleton(() => const PlacesMapper());
  // sl.registerLazySingleton(() => RoutesApiClient());

  //? Features
  //* GPS Permissions-Bloc
  // sl.registerFactory(
  //   () => GpsPermissionsBloc(
  //     sl(),
  //     sl(),
  //     sl(),
  //     sl(),
  //     sl(),
  //   ),
  // );

  //* Onboarding-Bloc
  serviceLocator.registerFactory(
    () => OnBoardingBloc(serviceLocator(), serviceLocator()),
  );

  //* Tracking-Bloc
  // sl.registerFactory(() => LocationBloc(sl(), sl(), sl()));
  // sl.registerFactory(() => SearchBloc(sl(), sl(), sl()));

  //* External
  serviceLocator.registerLazySingleton(() => RxSharedPreferences.getInstance());
}
