import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:smartcampus/common/utils/datehelper.dart';
import 'package:smartcampus/common/utils/navigationsutils.dart';
import 'package:smartcampus/common/widgets/devicesize.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import 'package:smartcampus/constants/colors.dart';
import 'package:smartcampus/constants/maps.dart';
import 'package:smartcampus/routes/app_routes.dart';

import '../../common/widgets/buttons.dart';

void showProfileSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    backgroundColor: lightGrayishBlue, // Make modal background transparent
    barrierColor: Colors.transparent, // Remove the dark overlay entirely
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: MyProfileBS(), // Wrap in container for styling
      );
    },
  );
}

class MyProfileBS extends StatefulWidget {
  const MyProfileBS({super.key});

  @override
  State<MyProfileBS> createState() => _MyProfileBSState();
}

class _MyProfileBSState extends State<MyProfileBS> {
  double h = 0.0;
  double w = 0.0;

  @override
  void initState() {
    super.initState();

    log(selectedCurrentTeacher.toString());
  }

  @override
  Widget build(BuildContext context) {
    h = Devicesize().getDeviceHeight(context);
    w = Devicesize().getDeviceWidth(context);
    return Container(
      height: h * 0.65,
      width: w,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CommonPadding.topPadding16,
            profileModule(
              'Date Of Birth',
              DateHelper().convertToDateFormat(
                0,
                selectedCurrentTeacher['date_of_birth'],
              ),
            ),
            profileModule(
              'Age',
              "${DateHelper().calculateAge(selectedCurrentTeacher['date_of_birth'])} Years",
            ),
            profileModule(
              'Department',
              selectedCurrentTeacher['subjects_handled'],
            ),
            profileModule(
              'Total Experience',
              "${selectedCurrentTeacher['experience_years']} Years",
            ),
            profileModule(
              'Date Of Joining',
              DateHelper().convertToDateFormat(
                0,
                selectedCurrentTeacher['joining_date'],
              ),
            ),
            profileModule(
              'Employment Type',
              selectedCurrentTeacher['employment_type'],
            ),
            profileModule('Phone', selectedCurrentTeacher['phone_number']),
            profileModule('Email', selectedCurrentTeacher['email']),
            CommonPadding.topPadding16,
            Buttons().circularElevatedButton(
              height: h * 0.05,
              width: w * 0.6,
              onPressed: () {
                NavigationsUtils().pushNameReplacementNavigation(
                  context,
                  AppRoutes.home,
                );
              },
              buttonBG: skyBlue,
              buttonText: "Back To Home",
              buttonTextColor: white,
              buttonTextSize: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget profileModule(String title, String value, {bool withDivider = true}) {
    return SizedBox(
      width: w * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonPadding.topPadding16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: skyBlue,
                ),
                maxLines: value.length > 10 ? 2 : 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
          if (withDivider) Divider(thickness: 1, color: Colors.black38),
        ],
      ),
    );
  }
}
