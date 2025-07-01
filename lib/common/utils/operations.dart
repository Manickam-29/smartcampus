import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:smartcampus/common/utils/navigationsutils.dart';
import 'package:smartcampus/constants/lists.dart';
import 'package:smartcampus/constants/maps.dart';
import 'package:smartcampus/routes/app_routes.dart';
import 'package:smartcampus/services/sboperations.dart';

import 'functions.dart';

class Operations {
  Future loadCurrentTeacherInfo(String teacherId) async {
    try {
      Map<String, dynamic> currentTeacherDetails =
          await SBOperations().retrieveCurrentTeacher(teacherId) ?? {};
      selectedCurrentTeacher = currentTeacherDetails;
    } catch (e) {
      log("Error loading teacher info: $e");
    }
  }

  void teacherDashBoard(BuildContext context, int index) {
    switch (index) {
      case 0:
        NavigationsUtils().pushNameReplacementNavigation(
          context,
          AppRoutes.myProfile,
        );
        break;

      case 1:
        NavigationsUtils().pushNameReplacementNavigation(
          context,
          AppRoutes.mySchedule,
        );
        break;

      case 2:
        NavigationsUtils().pushNameReplacementNavigation(
          context,
          AppRoutes.studentAttendance,
        );
        break;

      case 8:
        NavigationsUtils().pushNameReplacementNavigation(
          context,
          AppRoutes.splash,
        );
        break;

      default:
        log(teacherModuleTitles[index]);
        break;
    }
  }

  void getAllSubjectTodayTimeTable() {
    //String currentDay = DateHelper().getTodayDay();
    String currentDay = "Monday";
    List<Map<String, dynamic>> todayTimeTable = [];

    // A list of all grade schedules with associated class names
    List<Map<String, dynamic>> schedules = [
      {'data': grade1Schedule, 'class': 'Grade 1'},
      {'data': grade2Schedule, 'class': 'Grade 2'},
      {'data': grade3Schedule, 'class': 'Grade 3'},
      {'data': grade4Schedule, 'class': 'Grade 4'},
      {'data': grade5Schedule, 'class': 'Grade 5'},
    ];

    for (var schedule in schedules) {
      List<Map<String, dynamic>> gradeSchedule =
          List<Map<String, dynamic>>.from(schedule['data']);
      String className = schedule['class'];

      for (var subject in gradeSchedule) {
        if (subject['Day'] == currentDay) {
          Map<String, dynamic> map = Map<String, dynamic>.from(subject);
          map['Class'] = className;
          todayTimeTable.add(map);
        }
      }
    }

    todayAllTimeTable = todayTimeTable;
  }

  void extractSubjectsSchedule() {
    List<Map<String, String>> classes = [];
    String currentTeacherSubject = selectedCurrentTeacher['subjects_handled'];

    for (var schedule in todayAllTimeTable) {
      String grade = schedule['Class'];

      schedule.forEach((key, value) {
        // Skip non-time entries
        if (key == 'Class' || key == 'Day') return;

        if (value == currentTeacherSubject) {
          var times = key.split(': ')[0].split(' - ');
          String startTime = times[0];
          String endTime = times[1];

          classes.add({
            'timeSlot': key,
            'subject': value,
            'startTime': startTime,
            'endTime': endTime,
            'class': grade,
          });
        }
      });
    }

    subjectTimeTable = classes;
  }

  List<Map<String, dynamic>> getStudentFromSelectedClass(String selectedClass) {
    List<Map<String, dynamic>> selectStudDetails = [];

    for (int i = 0; i < studentsSchoolDetails.length; i++) {

      if (studentsSchoolDetails[i]['class_enrolled'] == selectedClass) {
        Map<String, dynamic> map = Functions().combineTwoMapData(
          studentsBasicDetails[i],
          studentsSchoolDetails[i],
        );

        selectStudDetails.add(map);
      }
    }
    return selectStudDetails;
  }
}
