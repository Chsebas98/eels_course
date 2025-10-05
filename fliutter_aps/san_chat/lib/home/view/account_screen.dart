import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/ui.dart';
import 'package:san_chat/home/widgets/card_container.dart';
import 'package:san_chat/home/widgets/info_account.dart';
import 'package:san_chat/utils/helpers.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, required this.nameUser});
  final String nameUser;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      appBar: AppBar(
        backgroundColor: AppColors.black2,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 0.05.sw,
            color: AppColors.white,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SafeArea(
          child: ElevatedButton(onPressed: () {}, child: Text('Log Out')),
        ),
      ),
      prevStack: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 82.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Helpers.getReadableRandomColor(),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              Helpers.getInitials(nameUser),
              style: TextStyle(color: AppColors.white, fontSize: 20.sp),
            ),
          ),
          10.verticalSpace,
          Text(
            nameUser,
            style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Mail',
            style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
          ),
        ],
      ),
      child: [_AccountControllerScreen(nameUser: nameUser)],
    );
  }
}

class _AccountControllerScreen extends StatelessWidget {
  const _AccountControllerScreen({required this.nameUser});
  final String nameUser;

  @override
  Widget build(BuildContext context) {
    return _AccountStructureScreen(nameUser: nameUser);
  }
}

class _AccountStructureScreen extends StatelessWidget {
  const _AccountStructureScreen({required this.nameUser});
  final String nameUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoAccount(label: 'Display Name', info: nameUser),
        30.verticalSpace,
        InfoAccount(label: 'Email Adress', info: 'email'),
      ],
    );
  }
}
