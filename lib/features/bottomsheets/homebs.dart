import 'package:flutter/material.dart';
import 'package:smartcampus/constants/colors.dart';
import 'package:smartcampus/common/widgets/dashboardicons.dart';
import 'package:smartcampus/common/widgets/devicesize.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import 'package:smartcampus/constants/lists.dart';
import '../../common/widgets/schooleventscarousel.dart';

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

class TeachersDashBoard extends StatefulWidget {
  const TeachersDashBoard({super.key});

  @override
  State<TeachersDashBoard> createState() => _TeachersDashBoardState();
}

class _TeachersDashBoardState extends State<TeachersDashBoard> {
  double h = 0.0, w = 0.0;
  @override
  Widget build(BuildContext context) {
    h = Devicesize().getDeviceHeight(context);
    w = Devicesize().getDeviceWidth(context);
    return Container(
      height: h * 0.85,
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
            CommonPadding.topPadding8,
            Center(
              child: SchoolEventsCarousel(h: h, w: w),
            ),
            CommonPadding.topPadding16,
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: teacherModuleIcons.length,
              itemBuilder: (context, index) {
                return dashBoardModule(
                  context,
                  h,
                  w,
                  teacherModuleTitles[index],
                  teacherModuleIcons[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
