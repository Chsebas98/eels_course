import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_guide/core/theme/colors.dart';

class AppTheme {
  AppTheme._();
  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: AppColors.primary,
    surface: AppColors.lightGrey,
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      backgroundColor: _colorSchemeLight.primary,
      minimumSize: const Size.fromHeight(42),
      disabledBackgroundColor: _colorSchemeLight.surface,
      foregroundColor: AppColors.white,
    ),
  );

  static final dividerThemeData = DividerThemeData(
    color: AppColors.primary.withValues(alpha: 0.2),
  );

  static final inputDecorationTheme = InputDecorationTheme(
    fillColor: AppColors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.white),
      borderRadius: BorderRadius.circular(20.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.white),
      borderRadius: BorderRadius.circular(20.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red),
      borderRadius: BorderRadius.circular(20.r),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red),
      borderRadius: BorderRadius.circular(20.r),
    ),
  );

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
    ).copyWith(
      elevatedButtonTheme: elevatedButtonTheme,
      dividerTheme: dividerThemeData,
      inputDecorationTheme: inputDecorationTheme,
    );
  }
}
