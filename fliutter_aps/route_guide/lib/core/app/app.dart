import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_guide/core/app/bloc/app_bloc.dart';
import 'package:route_guide/core/app/handlers/cubit/permission_cubit.dart';
import 'package:route_guide/core/core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) {
        AppRouter.initialize(
          context.read<AppBloc>(),
          context.read<PermissionCubit>(),
        );
        return BlocProvider(
          create: (context) => PermissionCubit(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.instance,
            title: 'App My Route',
            theme: AppTheme.light,
          ),
        );
      },
    );
  }
}
