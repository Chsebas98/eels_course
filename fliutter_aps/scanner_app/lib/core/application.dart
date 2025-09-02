import 'package:flutter/material.dart';
import 'package:scanner_app/presentation/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
        '/details/:id': (context) => PickUpServiceScreen(),
      },
    );
  }
}
