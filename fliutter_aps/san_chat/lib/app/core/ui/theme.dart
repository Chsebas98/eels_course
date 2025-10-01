import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/styles.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.softWhite,
          disabledForegroundColor: AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyDivider),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyDivider),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyDivider),
        ),
        labelStyle: TextStyle(
          color: AppColors.green,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        errorStyle: TextStyle(fontSize: 10.sp),
      ),
    );
  }
}
