import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/ui.dart';
import 'package:san_chat/app/core/widgets/buttons/custom_button.dart';
import 'package:san_chat/app/core/widgets/input_default/custom_input.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository_firebase_impl.dart';
import 'package:san_chat/login/cubit/login_cubit.dart';
import 'package:san_chat/sign_up/cubit/sign_up_cubit.dart';

GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
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
        body: _SignUpStructure(),
        bottomNavigationBar: _SignUpButton(),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          height: 48.h,
          child: CustomButton(
            action: () {
              if (signUpKey.currentState!.validate()) {
                context.read<SignUpCubit>().createAccount();
              }
            },
            desc: 'Create an account',
          ),
        ),
      ),
    );
  }
}

class _SignUpStructure extends StatefulWidget {
  const _SignUpStructure();

  @override
  State<_SignUpStructure> createState() => _SignUpStructureState();
}

class _SignUpStructureState extends State<_SignUpStructure> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return ListView(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: signUpKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
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
                          TextSpan(text: 'Sign up with '),
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
                                  'Email',
                                  style: TextStyle(
                                    color: AppColors.black2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,

                    Text(
                      'Get chatting with friends and family today by\nsigning up for our chat app!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
                    ),
                    60.verticalSpace,
                    CustomInput(
                      label: 'Your name',
                      onChanged: (value) {
                        debugPrint(value);
                        context.read<SignUpCubit>().onNameChanged(value);
                      },
                      validator: (value) {
                        final result = state.isValidName;
                        return result.isValid ? null : result.message;
                      },
                    ),
                    30.verticalSpace,
                    CustomInput(
                      label: 'Your email',
                      onChanged: (value) {
                        debugPrint(value);
                        context.read<SignUpCubit>().onMailChanged(value);
                      },
                      validator: (value) {
                        final result = state.isValidMail;
                        return result.isValid ? null : result.message;
                      },
                    ),
                    30.verticalSpace,
                    CustomInput(
                      label: 'Password',
                      onChanged: (value) {
                        debugPrint(value);
                        context.read<SignUpCubit>().onPasswordChanged(value);
                      },
                      validator: (value) {
                        final result = state.isValidPassword;
                        return result.isValid ? null : result.message;
                      },
                      isPsw: true,
                    ),
                    30.verticalSpace,
                    CustomInput(
                      label: 'Confirm Password',
                      onChanged: (value) {
                        debugPrint(value);
                        context.read<SignUpCubit>().onConfirmPasswordChanged(
                          value,
                        );
                      },
                      validator: (value) {
                        final result = state.pasword == value;
                        return result ? null : 'Las contraseñas no coinciden';
                      },
                      isPsw: true,
                      textInputAction: TextInputAction.done,
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
