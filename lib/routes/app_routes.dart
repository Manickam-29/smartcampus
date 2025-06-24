import 'package:flutter/material.dart';
import 'package:smartcampus/features/auth/splash.dart';


class AppRoutes {
  static const String splash = '/splash';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
  };
}
