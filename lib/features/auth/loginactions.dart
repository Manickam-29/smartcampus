import 'package:flutter/material.dart';
import 'package:smartcampus/common/utils/operations.dart';
import 'package:smartcampus/common/widgets/toastmessage.dart';
import 'package:smartcampus/constants/lists.dart';
import 'package:smartcampus/routes/app_routes.dart';

class LoginActions {
  void loginButtonActionForTeacher(
    BuildContext context,
    String id,
    String pass,
  ) {
    bool found = false;

    for (var value in teacherBasicDetails) {
      if (value['teacher_id'] == id) {
        found = true;
        ToastMessage.success(context, "User ID found. Verifying password...");

        if (value['password'] == pass) {
          ToastMessage.success(
            context,
            "Login successful! Taking you to the dashboard...",
          );

          Operations().loadCurrentTeacherInfo(id);

          Navigator.pushReplacementNamed(context, AppRoutes.home);
        } else {
          ToastMessage.error(context, "Password doesn’t match our records.");
        }

        break; // No need to check further once ID is found
      }
    }

    if (!found) {
      ToastMessage.error(
        context,
        "We couldn't find your ID. Please verify your input.",
      );
    }
  }

  void loginButtonActionForStudent(
    BuildContext context,
    String id,
    String pass,
  ) {
    bool found = false;

    for (var value in studentsBasicDetails) {
      if (value['roll_number'] == id) {
        found = true;
        ToastMessage.success(context, "User ID found. Verifying password...");

        if (value['password'] == pass) {
          ToastMessage.success(
            context,
            "Login successful! Taking you to the dashboard...",
          );
          // Navigate to home/dashboard here
        } else {
          ToastMessage.error(context, "Password doesn’t match our records.");
        }

        break; // No need to check further once ID is found
      }
    }

    if (!found) {
      ToastMessage.error(
        context,
        "We couldn't find your ID. Please verify your input.",
      );
    }
  }
}
