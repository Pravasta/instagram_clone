import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static pushName(String routeName, {Object? arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static pop() {
    return navigatorKey.currentState?.pop();
  }

  static pushReplacement(String routeName, {Object? arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }
}
