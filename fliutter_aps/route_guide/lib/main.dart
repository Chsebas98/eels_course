import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_guide/core/app/app.dart';
import 'package:route_guide/core/app/bloc/app_bloc.dart';
import 'package:route_guide/core/app/di/injection_repositories.dart' as di;
import 'package:route_guide/core/app/handlers/cubit/permission_cubit.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di.serviceLocator<AppBloc>()..add(const CheckExistUserEvent()),
        ),
        BlocProvider(create: (context) => PermissionCubit()),
      ],
      child: const MyApp(),
    ),
  );
}
