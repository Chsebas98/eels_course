import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/presentation/theme/styles.dart';
import 'package:san_chat/presentation/widgets/social_network/custom_social_network.dart';

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
    return Stack(
      children: [
        Image.asset(
          'assets/images/onBoardingBackground.png',
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
                Center(child: Image.asset('assets/png/iconApp.png')),
                41.verticalSpace,
                Text(
                  'Connect\nfriends\neasily &\nquickly',
                  style: TextStyle(
                    fontSize: 60.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                16.verticalSpace,
                Text(
                  'Our chat app is the perfect way to stay\nconnected with friends and family.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(185, 193, 190, 1),
                  ),
                ),
                SizedBox(height: 38),
                CustomSocialNetwork(
                  actionFacebook: () {
                    debugPrint('Login con Facebook');
                  },
                  actionGoogle: () {
                    debugPrint('Login con Google');
                  },
                  actionApple: () {
                    debugPrint('Login con Apple');
                  },
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.greyDivider)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.greyDivider)),
                  ],
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: Text('Sign up with mail'),
                  ),
                ),
                SizedBox(height: 46),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: FilledButton.styleFrom(overlayColor: Colors.grey),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
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
