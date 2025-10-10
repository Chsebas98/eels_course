import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:san_chat/app/auth/bloc/view/auth_handler.dart';
import 'package:san_chat/firebase_options.dart';
import 'package:san_chat/home/bloc/home_bloc.dart';
import 'package:san_chat/home/view/account_screen.dart';
import 'package:san_chat/home/view/home_screen.dart';
import 'package:san_chat/login/view/login_screen.dart';
import 'package:san_chat/root/view/root_page.dart';
import 'package:san_chat/sign_up/view/signup_screen.dart';
import 'package:san_chat/onboarding/onboarding_screen.dart';
import 'package:san_chat/app/core/ui/app_navigator.dart';
import 'package:san_chat/app/core/ui/theme.dart';

final rootScaffoldState = GlobalKey<ScaffoldMessengerState>();
final _navigatorKey = GlobalKey<NavigatorState>();
late final FirebaseApp app;
late final FirebaseAuth auth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSignIn.instance.initialize();
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
        return AuthHandler(
          navigatorKey: _navigatorKey,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKey,
            initialRoute: '/',
            scaffoldMessengerKey: rootScaffoldState,
            routes: {
              AppNavigator.main: (context) => RootPage(),
              AppNavigator.onBoarding: (context) => OnBoardingScreen(),
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
                return BlocProvider(
                  create: (context) => HomeBloc(),
                  child: AccountScreen(nameUser: nameUser),
                );
              },
            },
            theme: AppTheme.light,
          ),
        );
      },
    );
  }
}
