import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:route_guide/core/router/app_routes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Tener buena salud", style: textTheme.titleLarge),
            Image.asset('assets/icons/icon_app.png'),
            Text(
              "Estar sano lo es todo, no tener salud no es nada.\nEntonces, ¿por qué no?",
              style: textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () => context.go(OnBoardingRoutes.infoFull),
              child: const Text('Empezar'),
            ),
          ],
        ),
      ),
    );
  }
}
