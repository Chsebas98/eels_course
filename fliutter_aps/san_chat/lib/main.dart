import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/firebase_options.dart';
import 'package:san_chat/home/view/account_screen.dart';
import 'package:san_chat/home/view/home_screen.dart';
import 'package:san_chat/login/view/login_screen.dart';
import 'package:san_chat/sign_up/view/signup_screen.dart';
import 'package:san_chat/onboarding/onboarding_screen.dart';
import 'package:san_chat/app/core/ui/app_navigator.dart';
import 'package:san_chat/app/core/ui/theme.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  auth = FirebaseAuth.instanceFor(app: app);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            AppNavigator.main: (context) => OnBoardingScreen(),
            AppNavigator.login: (context) => LoginScreen(),
            AppNavigator.signUp: (context) => SignUpScreen(),
            AppNavigator.home: (context) => HomeScreen(),
            AppNavigator.account: (context) {
              final args = ModalRoute.of(context)?.settings.arguments;
              String nameUser = '';
              if (args is String) {
                nameUser = args;
              } else if (args is Map && args['nameUser'] is String) {
                nameUser = args['nameUser'] as String;
              }
              return AccountScreen(nameUser: nameUser);
            },
          },
          theme: AppTheme.light,
        );
      },
    );
  }
}
