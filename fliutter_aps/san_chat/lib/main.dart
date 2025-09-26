import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/presentation/screens/auth/login_screen.dart';
import 'package:san_chat/presentation/screens/auth/signup_screen.dart';
import 'package:san_chat/presentation/screens/onboarding_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (_) => OnBoardingScreen(),
            '/login': (_) => LoginScreen(),
            '/signUp': (_) => SignUpScreen(),
          },
        );
      },
    );
  }
}
