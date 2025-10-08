import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/models/models.dart';
import 'package:san_chat/app/core/ui/ui.dart';

// ignore: non_constant_identifier_names
SnackBar CustomSnackbar({
  required ToastType toastType,
  required ToastInterface toastInfo,
  VoidCallback? actionClosed,
}) {
  final Color bg = switch (toastType) {
    ToastType.succes => const Color(0xFFECFDF3),
    ToastType.error => const Color(0xFFFFF1F2),
    ToastType.warning => const Color(0xFFFFFBEB),
    _ => const Color(0xFFF3F4F6),
  };
  final Color border = switch (toastType) {
    ToastType.succes => const Color(0xFF10B981),
    ToastType.error => const Color(0xFFEF4444),
    ToastType.warning => const Color(0xFFF59E0B),
    _ => const Color(0xFF9CA3AF),
  };
  final Color text = const Color(0xFF111827);

  return SnackBar(
    behavior: SnackBarBehavior.floating,

    elevation: 0,
    margin: EdgeInsets.symmetric(horizontal: 24.w),
    backgroundColor: Colors.transparent, // está bien si el content tiene fondo
    duration: const Duration(seconds: 5),
    content: Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 importante
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            toastInfo.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: text,
            ),
          ),
          8.verticalSpace,
          Text(
            toastInfo.description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: text,
            ),
          ),
          10.verticalSpace,
          FilledButton(
            onPressed: actionClosed,
            style: FilledButton.styleFrom(backgroundColor: border),
            child: Text(
              'Okay',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: AppColors.black2,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
