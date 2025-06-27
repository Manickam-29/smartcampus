import 'package:flutter/material.dart';

class NavigationsUtils {
  //Back Navigations
  void popNavigation(BuildContext context) {
    Navigator.pop(context);
  }

  //Normal Navigations
  void pushNameNavigation(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  //Normal Navigations - with Replacement
  void pushNameReplacementNavigation(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
