import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/ui.dart';
import 'package:san_chat/app/core/widgets/buttons/custom_button.dart';
import 'package:san_chat/app/core/widgets/input_default/custom_input.dart';
import 'package:san_chat/app/core/widgets/social_network/custom_social_network.dart';

GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: _LogInStructure(),
      bottomNavigationBar: _LoginButton(),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          height: 48.h,
          child: CustomButton(
            action: () {
              if (loginFormKey.currentState!.validate()) {}
            },
            desc: 'Log In',
          ),
        ),
      ),
    );
  }
}

class _LogInStructure extends StatelessWidget {
  const _LogInStructure();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              60.verticalSpace,
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: AppColors.black2,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 8.h,
                                color: AppColors.greenSoft,
                              ),
                            ),
                          ),
                          Text(
                            'Log in',
                            style: TextStyle(
                              color: AppColors.black2,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextSpan(text: ' to Chatbox'),
                  ],
                ),
              ),
              16.verticalSpace,

              Text(
                'Welcome back! Sign in using your social\naccount or email to continue us',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSocialNetwork(
                    action: () {
                      debugPrint('Login con Facebook');
                    },
                    imageSvg: AppDrawables.iconFacebook,
                    colorBorder: Colors.black,
                  ),
                  20.horizontalSpace,
                  CustomSocialNetwork(
                    action: () {
                      debugPrint('Login con Google');
                    },
                    imageSvg: AppDrawables.iconGoogle,
                    colorBorder: Colors.black,
                  ),
                  20.horizontalSpace,
                  CustomSocialNetwork(
                    action: () {
                      debugPrint('Login con Apple');
                    },
                    imageSvg: AppDrawables.iconAppleDark,
                    colorBorder: Colors.black,
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
                      style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.greyDivider)),
                ],
              ),
              30.verticalSpace,
              CustomInput(
                label: 'Your email',
                onChanged: (value) {
                  debugPrint(value);
                },
                validator: (value) {
                  return 'hola';
                },
              ),
              30.verticalSpace,
              CustomInput(
                label: 'Password',
                onChanged: (value) {
                  debugPrint(value);
                },
                validator: (value) {
                  return 'hola';
                },
                isPsw: true,
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
