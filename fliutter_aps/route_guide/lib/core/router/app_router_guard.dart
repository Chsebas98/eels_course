import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:route_guide/core/router/app_routes.dart';

class AppRouterGuard {
  //defino constructor privado
  AppRouterGuard._();

  //evita que se regrese hacia atras
  static void goToInformationPage(BuildContext context) {
    context.go(OnBoardingRoutes.infoFull);
  }

  //apilando las pantallas
  static void pushToInformationPage(BuildContext context) {
    context.push(OnBoardingRoutes.infoFull);
  }
}
