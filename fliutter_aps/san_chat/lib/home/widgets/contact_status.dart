import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/ui.dart';
import 'package:san_chat/utils/helpers.dart';

class ContactStatus extends StatelessWidget {
  const ContactStatus({super.key, required this.nameUser, this.status = false});

  final String nameUser;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 35.w,
          height: 35.h,
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Helpers.getReadableRandomColor(),
          ),
          child: Text(
            Helpers.getInitials(nameUser),
            style: TextStyle(color: AppColors.white, fontSize: 16.sp),
          ),
        ),
        10.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              nameUser,
              style: TextStyle(
                color: AppColors.black1,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
            2.verticalSpace,
            Text(
              status ? 'In Line' : 'Offline',
              style: TextStyle(
                color: status ? AppColors.statusColorConnected : AppColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
        const Spacer(),
        Icon(
          Icons.circle_rounded,
          color: status
              ? AppColors.statusColorConnected
              : AppColors.statusColorDisconect,
          size: 0.06.sw,
        ),
      ],
    );
  }
}
