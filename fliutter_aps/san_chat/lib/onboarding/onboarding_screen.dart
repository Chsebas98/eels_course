import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/models/models.dart';
import 'package:san_chat/app/core/ui/ui.dart';
import 'package:san_chat/app/core/widgets/snackbar/custom_snackbar.dart';
import 'package:san_chat/app/core/widgets/social_network/custom_social_network.dart';
import 'package:san_chat/main.dart';
import 'package:san_chat/onboarding/cubit/onboarding_cubit.dart';
import 'package:san_chat/utils/helpers.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _OnBoardingController(),
      ),
    );
  }
}

class _OnBoardingController extends StatefulWidget {
  const _OnBoardingController();

  @override
  State<_OnBoardingController> createState() => _OnBoardingControllerState();
}

class _OnBoardingControllerState extends State<_OnBoardingController> {
  @override
  void dispose() {
    rootScaffoldState.currentState?.hideCurrentSnackBar();
    super.dispose();
  }

  void _showSnackbar() {
    rootScaffoldState.currentState?.showSnackBar(
      CustomSnackbar(
        actionClosed: () =>
            rootScaffoldState.currentState?.hideCurrentSnackBar(),
        toastType: ToastType.error,
        toastInfo: ToastInterface(
          title: 'Error al iniciar sesión con Google',
          description: 'Ha ocurrido un error al iniciar sesion con Google',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, Status>(
      listener: (context, state) {
        if (state == Status.error) {
          _showSnackbar();
        }
      },
      child: _OnBoardingStructure(),
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
                        context.read<OnboardingCubit>().signInWithGoogle();
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
