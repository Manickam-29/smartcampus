import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final List<String> whoAreYou = ["teacher", "student"];
List<Map<String, dynamic>> inAppImages = [];
List<Map<String, dynamic>> teacherBasicDetails = [];
List<Map<String, dynamic>> teachersProfessionalDetails = [];
List<Map<String, dynamic>> studentsBasicDetails = [];
List<Map<String, dynamic>> studentsSchoolDetails = [];
List<Map<String, dynamic>> schoolEventsDetails = [];
List<Map<String, dynamic>> grade1Schedule = [];
List<Map<String, dynamic>> grade2Schedule = [];
List<Map<String, dynamic>> grade3Schedule = [];
List<Map<String, dynamic>> grade4Schedule = [];
List<Map<String, dynamic>> grade5Schedule = [];
List<Map<String,dynamic>> todayAllTimeTable = [];
List<Map<String,dynamic>> currentTeacherSchedule = [];
List<Map<String, dynamic>> subjectTimeTable = [];
List<String> teacherModuleTitles = [
  "My Profile",
  "My Schedule",
  "Class & Subjects",
  "Student Attendance",
  "Exams",
  "Marks Reports",
  "Leave Application",
  "Help & Support",
  "Log Out",
];
List<IconData> teacherModuleIcons = [
  Icons.perm_identity,
  Icons.schedule,
  Icons.class_,
  Icons.list,
  MdiIcons.notebookEdit,
  MdiIcons.chartBar,
  MdiIcons.applicationEditOutline,
  MdiIcons.helpBoxMultipleOutline,
  Icons.logout,
];
List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
