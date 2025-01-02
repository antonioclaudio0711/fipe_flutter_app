import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  dynamic navigateTo(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(
      route,
      arguments: arguments,
    );
  }

  dynamic pushNamedAndRemoveUntil(String route, {dynamic arguments}) async =>
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        route,
        (Route<dynamic> route) => false,
        arguments: arguments,
      );

  dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}
