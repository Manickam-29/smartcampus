import 'package:flutter/material.dart';
import 'package:smartcampus/common/widgets/loadingscreen.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import '../../constants/colors.dart';
import '../bottomsheets/studattendancebs.dart';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({super.key});

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  double h = 0.0, w = 0.0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _loadTeacherData();
  }

  Future<void> _loadTeacherData() async {




    if (mounted) {
      setState(() => isLoading = false);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        showStudentAttendanceBS(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: skyBlue,
      body: SafeArea(
        child: isLoading
            ? LoadingScreen()
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonPadding.topPadding24,
                    Text(
                      'Student Attendance',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
