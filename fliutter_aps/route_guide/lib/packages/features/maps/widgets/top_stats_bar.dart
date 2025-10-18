import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_guide/core/core.dart';

class TopStatsBar extends StatelessWidget {
  const TopStatsBar({
    super.key,
    this.distance = '0',
    this.kcal = '0',
    this.velocity = '0',
  });
  final String distance;
  final String kcal;
  final String velocity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _statItem('assets/icons/running_icon.png', distance, 'km'),
            VerticalDivider(thickness: 1, color: Colors.grey),
            _statItem('assets/icons/fire_icon.png', kcal, 'kcal'),
            VerticalDivider(thickness: 1, color: Colors.grey),
            _statItem('assets/icons/velocity_icon.png', velocity, 'Minutes'),
          ],
        ),
      ),
    );
  }

  Widget _statItem(String image, String value, String unit) {
    return Row(
      children: [
        Image.asset(image),
        SizedBox(width: 4),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              unit,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
