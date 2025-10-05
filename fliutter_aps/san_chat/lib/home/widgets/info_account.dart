import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/ui.dart';

class InfoAccount extends StatelessWidget {
  const InfoAccount({super.key, required this.label, required this.info});
  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black2,
          ),
        ),
      ],
    );
  }
}
