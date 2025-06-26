import 'package:flutter/material.dart';
import 'package:smartcampus/constants/colors.dart';
import 'package:smartcampus/features/teachers/dashboard.dart';

void showHomeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    backgroundColor: white, // Make modal background transparent
    barrierColor: Colors.transparent, // Remove the dark overlay entirely
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: TeachersDashBoard(), // Wrap in container for styling
      );
    },
  );
}

