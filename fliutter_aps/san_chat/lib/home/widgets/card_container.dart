import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/ui.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.appBar,
    required this.bottomNavigationBar,
    this.prevStack,
    required this.child,
  });
  final List<Widget> child;
  final PreferredSizeWidget appBar;
  final Widget bottomNavigationBar;
  final Widget? prevStack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black2,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: [
          prevStack ?? SizedBox.shrink(),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (context, scrollController) => Material(
              color: AppColors.white,
              elevation: 6,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              child: Material(
                color: AppColors.white,
                elevation: 6,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
                  children: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
