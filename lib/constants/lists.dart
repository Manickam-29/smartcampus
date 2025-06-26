import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final List<String> whoAreYou = ["teacher", "student"];
List<Map<String, dynamic>> inAppImages = [];
List<Map<String, dynamic>> teacherBasicDetails = [];
List<Map<String, dynamic>> teachersProfessionalDetails = [];
List<Map<String, dynamic>> studentsBasicDetails = [];
List<Map<String, dynamic>> studentsSchoolDetails = [];
List<Map<String, dynamic>> schoolEventsDetails = [];
List<String> teacherModuleTitles = [
  "My Profile",
  "My Schedule",
  "Class & Subjects",
  "Student Attendance",
  "Exams",
  "Marks Reports",
  "Leave Application",
  "Events",
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
  MdiIcons.calendarMultiple,
  MdiIcons.helpBoxMultipleOutline,
  Icons.logout,
];
