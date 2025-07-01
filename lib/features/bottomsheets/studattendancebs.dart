import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:smartcampus/common/utils/operations.dart';
import 'package:smartcampus/common/widgets/loadingscreen.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import 'package:smartcampus/constants/lists.dart';
import '../../common/utils/navigationsutils.dart';
import '../../common/widgets/buttons.dart';
import '../../common/widgets/checkboxgroup.dart';
import '../../common/widgets/devicesize.dart';
import '../../common/widgets/dropdowns.dart';
import '../../constants/colors.dart';
import '../../routes/app_routes.dart';

void showStudentAttendanceBS(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    backgroundColor: lightGrayishBlue,
    barrierColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StudAttendance(),
      );
    },
  );
}

class StudAttendance extends StatefulWidget {
  const StudAttendance({super.key});

  @override
  State<StudAttendance> createState() => _StudAttendanceState();
}

class _StudAttendanceState extends State<StudAttendance> {
  double h = 0.0, w = 0.0;
  String selectedClass = classesList[0];
  List<Map<String, dynamic>> studList = [];
  bool isLoading = true;
  List<Map<String, dynamic>> currentAttendance = [];

  @override
  void initState() {
    super.initState();

    loadStudentDetails();
  }

  void loadStudentDetails() {
    setState(() {
      studList = Operations().getStudentFromSelectedClass(selectedClass);

      isLoading = false;
    });

    log(studList.toString());
  }

  @override
  Widget build(BuildContext context) {
    h = Devicesize().getDeviceHeight(context);
    w = Devicesize().getDeviceWidth(context);
    return isLoading
        ? LoadingScreen()
        : Container(
            height: h * 0.9,
            width: w,
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonPadding.topPadding16,
                //Dropdown
                SizedBox(
                  width: w * 0.8,
                  child: Dropdowns().simpleDropdown(
                    hintText: "Class",
                    items: classesList,
                    initialItem: selectedClass,
                    onChanged: (value) {
                      setState(() {
                        selectedClass = value!;
                        currentAttendance = [];
                        isLoading = true;
                      });
                      loadStudentDetails();
                    },
                  ),
                ),
                CommonPadding.topPadding24,
                SizedBox(
                  height: h * 0.7,
                  width: w * 0.8,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return attendanceBox(studList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return CommonPadding.topPadding16;
                    },
                    itemCount: studList.length,
                  ),
                ),
                //Back to Home
                buttonsActions(),
              ],
            ),
          );
  }

  Widget attendanceBox(Map<String, dynamic> item) {
    final rollNumber = item['roll_number'];
    return Container(
      height: h * 0.15,
      width: w * 0.75,
      decoration: BoxDecoration(
        color: lightBlueBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          CommonPadding.topPadding16,
          Row(
            children: [
              CommonPadding.leftPadding16,
              Text(
                rollNumber,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              CommonPadding.leftPadding16,
              Text(
                item['first_name'],
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              CommonPadding.leftPadding8,
              Text(
                item['last_name'],
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
          CommonPadding.topPadding16,
          Divider(color: Colors.black38),

          // Controlled checkbox
          CheckboxGroup(
            options: attendanceOptions,
            selected: '',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget buttonsActions() {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Buttons().circularElevatedButton(
            height: h * 0.05,
            width: w * 0.3,
            onPressed: () {
              NavigationsUtils().pushNameReplacementNavigation(
                context,
                AppRoutes.home,
              );
            },
            buttonBG: skyBlue,
            buttonText: "Home",
            buttonTextColor: white,
            buttonTextSize: 24,
          ),

          Buttons().circularElevatedButton(
            height: h * 0.05,
            width: w * 0.3,
            onPressed: () {
              log(currentAttendance.toString());
            },
            buttonBG: skyBlue,
            buttonText: "Submit",
            buttonTextColor: white,
            buttonTextSize: 24,
          ),
        ],
      ),
    );
  }
}
