import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/presentation/theme/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.action, required this.desc});
  final VoidCallback? action;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        disabledBackgroundColor: AppColors.softWhite,
        disabledForegroundColor: AppColors.grey,
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.white,
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
      child: Text(desc),
    );
  }
}
