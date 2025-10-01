import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/ui.dart';
import 'package:san_chat/app/core/widgets/social_network/custom_social_network.dart';
import 'package:san_chat/utils/hepers.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _OnBoardingStructure(),
    );
  }
}

class _OnBoardingStructure extends StatelessWidget {
  const _OnBoardingStructure();

  @override
  Widget build(BuildContext context) {
    final config = Helpers.getConfigDevice(MediaQuery.of(context).size.width);
    return Stack(
      children: [
        Image.asset(
          AppDrawables.appBackground,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AppDrawables.appIcon,
                    width: 71.w,
                    fit: BoxFit.cover,
                  ),
                ),
                41.verticalSpace,
                Text(
                  'Connect\nfriends\neasily &\nquickly',
                  style: TextStyle(
                    fontSize: config == ConfigDevice.tablet ? 40.sp : 58.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                16.verticalSpace,
                Text(
                  'Our chat app is the perfect way to stay\nconnected with friends and family.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color.fromRGBO(185, 193, 190, 1),
                  ),
                ),
                SizedBox(height: 38),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialNetwork(
                      action: () {
                        debugPrint('Login con Facebook');
                      },
                      imageSvg: AppDrawables.iconFacebook,
                    ),
                    20.horizontalSpace,
                    CustomSocialNetwork(
                      action: () {
                        debugPrint('Login con Google');
                      },
                      imageSvg: AppDrawables.iconGoogle,
                    ),
                    20.horizontalSpace,
                    CustomSocialNetwork(
                      action: () {
                        debugPrint('Login con Apple');
                      },
                      imageSvg: AppDrawables.iconApple,
                    ),
                  ],
                ),
                30.verticalSpace,
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.greyDivider)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.greyDivider)),
                  ],
                ),
                30.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppNavigator.signUp);
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16.r),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: Text('Sign up with mail'),
                  ),
                ),
                const Spacer(),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppNavigator.login);
                    },
                    style: FilledButton.styleFrom(overlayColor: Colors.grey),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(text: 'Existing account?'),
                          TextSpan(
                            text: ' Log in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
