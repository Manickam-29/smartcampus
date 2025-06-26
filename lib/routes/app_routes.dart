import 'package:flutter/material.dart';
import 'package:smartcampus/features/auth/login.dart';
import 'package:smartcampus/features/auth/splash.dart';
import 'package:smartcampus/features/teachers/home.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
  };
}
