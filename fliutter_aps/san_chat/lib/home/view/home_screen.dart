import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/ui.dart';
import 'package:san_chat/app/core/widgets/social_network/custom_social_network.dart';
import 'package:san_chat/home/widgets/card_container.dart';
import 'package:san_chat/home/widgets/contact_status.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      appBar: AppBar(
        backgroundColor: AppColors.black2,
        leading: CustomSocialNetwork(
          action: () {
            debugPrint('Search');
          },
          imageSvg: 'assets/svg/iconSearch.svg',
        ),
        title: Text('Home'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20.sp),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppNavigator.account,
                arguments: 'Sebastian Soberon',
              );
            },
            child: Image.asset('assets/svg/avatarUser.png', width: 44.w),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox.shrink(),
      child: [_HomeScreenController()],
    );
    // return Scaffold(
    //   backgroundColor: AppColors.black2,
    //   appBar: AppBar(
    //     backgroundColor: AppColors.black2,
    //     leading: CustomSocialNetwork(
    //       action: () {
    //         debugPrint('Search');
    //       },
    //       imageSvg: 'assets/svg/iconSearch.svg',
    //     ),
    //     title: Text('Home'),
    //     centerTitle: true,
    //     titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20.sp),
    //     actions: [
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.pushNamed(
    //             context,
    //             AppNavigator.account,
    //             arguments: 'Sebastian Soberon',
    //           );
    //         },
    //         child: Image.asset('assets/svg/avatarUser.png', width: 44.w),
    //       ),
    //     ],
    //   ),
    //   body: _HomeScreenController(),
    //   bottomNavigationBar: Container(
    //     color: AppColors.white,
    //     padding: EdgeInsets.symmetric(horizontal: 24.w),
    //     child: SafeArea(
    //       child: ElevatedButton(onPressed: () {}, child: Text('data')),
    //     ),
    //   ),
    // );
  }
}

class _HomeScreenController extends StatefulWidget {
  const _HomeScreenController();

  @override
  State<_HomeScreenController> createState() => _HomeScreenControllerState();
}

class _HomeScreenControllerState extends State<_HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return _HomeScreenStructure();
  }
}

class _HomeScreenStructure extends StatelessWidget {
  const _HomeScreenStructure();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Contact',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.black1,
            fontWeight: FontWeight.w600,
          ),
        ),
        20.verticalSpace,
        ContactStatus(nameUser: 'Alvaro Armijos'),
        20.verticalSpace,
        ContactStatus(nameUser: 'Sebastian Soberon'),
        20.verticalSpace,
        ContactStatus(nameUser: 'Cathy', status: true),
      ],
    );
  }
}
