import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_guide/core/app/handlers/cubit/permission_cubit.dart';
import 'package:route_guide/core/core.dart';

class RequestPermissionPage extends StatelessWidget {
  const RequestPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: _RequestPermissionController(),
    );
  }
}

class _RequestPermissionController extends StatelessWidget {
  const _RequestPermissionController();

  @override
  Widget build(BuildContext context) {
    return _RequestPermissionStructure();
  }
}

class _RequestPermissionStructure extends StatelessWidget {
  const _RequestPermissionStructure();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionCubit, PermissionState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Icon(
                Icons.location_disabled_rounded,
                size: 0.12.sw,
                color: AppColors.primary,
              ),
              20.verticalSpace,
              Text(
                'Es necesario que actives los permisos de ubicación para continuar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              40.verticalSpace,

              Text('RequestPermissionPage ${state.ubicacion}'),
            ],
          ),
        );
      },
    );
  }
}
