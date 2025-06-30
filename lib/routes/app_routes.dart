import 'package:flutter/material.dart';
import 'package:smartcampus/features/auth/login.dart';
import 'package:smartcampus/features/auth/splash.dart';
import 'package:smartcampus/features/teachers/home.dart';
import 'package:smartcampus/features/teachers/myprofile.dart';
import 'package:smartcampus/features/teachers/myschedule.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String myProfile = '/myProfile';
  static const String mySchedule = '/mySchedule';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    myProfile: (context) => const MyProfile(),
    mySchedule: (context) => const Myschedule()
  };
}
