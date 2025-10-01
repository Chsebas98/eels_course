import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:san_chat/app/core/ui/ui.dart';

class CustomSocialNetwork extends StatelessWidget {
  const CustomSocialNetwork({
    super.key,
    required this.action,
    required this.imageSvg,
    this.colorBorder = AppColors.greyCircleBorder,
  });
  final VoidCallback action;
  final String imageSvg;
  final Color colorBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: colorBorder),
      ),
      child: GestureDetector(
        onTap: action,
        child: SvgPicture.asset(
          imageSvg,
          width: 46.w,
          height: 36.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
