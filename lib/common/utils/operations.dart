import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:smartcampus/constants/lists.dart';
import 'package:smartcampus/constants/maps.dart';
import 'package:smartcampus/routes/app_routes.dart';
import 'package:smartcampus/services/sboperations.dart';

class Operations {
  Future loadCurrentTeacherInfo(String teacherId) async {
    try {
      Map<String, dynamic> currentTeacherDetails =
          await SBOperations().retrieveCurrentTeacher(teacherId) ?? {};
      selectedCurrentTeacher = currentTeacherDetails;
      log("selectedCurrentTeacher $selectedCurrentTeacher");
    } catch (e) {
      log("Error loading teacher info: $e");
    }
  }

  void teacherDashBoard(BuildContext context, int index) {
    switch (index) {
      case 9:
        Navigator.pushReplacementNamed(context, AppRoutes.splash);
        break;

      default:
        log(teacherModuleTitles[index]);
        break;
    }
  }
}
