import 'package:flutter/material.dart';
import 'package:smartcampus/common/widgets/loadingscreen.dart';
import '../../constants/colors.dart';
import '../bottomsheets/myschedulebs.dart';

class Myschedule extends StatefulWidget {
  const Myschedule({super.key});

  @override
  State<Myschedule> createState() => _MyscheduleState();
}

class _MyscheduleState extends State<Myschedule> {
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
        showScheduleSheet(context);
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
                    Text(
                      'My Schedule',
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
