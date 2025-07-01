import 'package:flutter/material.dart';
import 'package:smartcampus/common/utils/datehelper.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import 'package:smartcampus/constants/lists.dart';
import 'package:smartcampus/constants/maps.dart';
import '../../common/utils/functions.dart';
import '../../common/utils/navigationsutils.dart';
import '../../common/widgets/buttons.dart';
import '../../common/widgets/devicesize.dart';
import '../../constants/colors.dart';
import '../../routes/app_routes.dart';

void showScheduleSheet(BuildContext context) {
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
        child: const MyScheduleBS(),
      );
    },
  );
}

// --- No changes to imports or showScheduleSheet function ---

class MyScheduleBS extends StatefulWidget {
  const MyScheduleBS({super.key});

  @override
  State<MyScheduleBS> createState() => _MyScheduleBSState();
}

class _MyScheduleBSState extends State<MyScheduleBS> {
  double h = 0.0;
  double w = 0.0;
  List<String> getCurrentWeekDays = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    getCurrentWeekDays = DateHelper().getFormattedCurrentWeekDates();
  }

  @override
  Widget build(BuildContext context) {
    h = Devicesize().getDeviceHeight(context);
    w = Devicesize().getDeviceWidth(context);
    return Container(
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
        children: [
          CommonPadding.topPadding16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: h * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  bool isToday = Functions().compareTwoDatesSame(
                    getCurrentWeekDays[index],
                    DateHelper().getFormattedTodayDate(),
                  );
                  bool isSelected = selectedIndex == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = selectedIndex == index ? -1 : index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: boxDateWidget(index, isSelected || isToday),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(children: [..._buildClassSchedule()]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Buttons().circularElevatedButton(
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
          )
        ],
      ),
    );
  }

  List<Widget> _buildClassSchedule() {
    return List.generate(subjectTimeTable.length, (index) {
      final item = subjectTimeTable[index];
      return Column(
        children: [
          ClassInfo(
            startTime: item["startTime"]!,
            endTime: item["endTime"]!,
            subject: selectedCurrentTeacher['subjects_handled'],
            grade: item["class"]!,
          ),
          CommonPadding.topPadding16,
          Divider(thickness: 1.5, color: Colors.black26),
          CommonPadding.topPadding16,
        ],
      );
    });
  }

  Widget boxDateWidget(int index, bool enable) {
    return Container(
      height: h * 0.15,
      width: w * 0.15,
      decoration: BoxDecoration(
        color: enable ? skyBlue : white,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: Border.all(color: skyBlue.withOpacity(0.3)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getCurrentWeekDays[index],
              style: TextStyle(fontSize: 16, color: enable ? white : skyBlue),
            ),
            CommonPadding.topPadding4,
            Text(
              days[index],
              style: TextStyle(fontSize: 16, color: enable ? white : skyBlue),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassInfo extends StatefulWidget {
  final String startTime;
  final String endTime;
  final String subject;
  final String grade;

  const ClassInfo({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.grade,
  });

  @override
  State<ClassInfo> createState() => _ClassInfoState();
}

class _ClassInfoState extends State<ClassInfo> {
  double h = 0.0, w = 0.0;
  late String status;

  @override
  void initState() {
    super.initState();
    status = DateHelper().getTaskStatus(widget.startTime, widget.endTime);
  }

  @override
  Widget build(BuildContext context) {
    h = Devicesize().getDeviceHeight(context);
    w = Devicesize().getDeviceWidth(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.startTime,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  '|\n|\n|\n|',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.endTime,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(width: w * 0.1),
            Column(
              children: [
                Container(
                  height: h * 0.04,
                  width: w * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      widget.subject,
                      style: TextStyle(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                CommonPadding.topPadding16,
                Text(
                  widget.grade,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        autoClassStatusUpdated(status),
      ],
    );
  }

  Widget autoClassStatusUpdated(String status) {
    Color statusColor;
    IconData statusIcon;

    switch (status) {
      case "pending":
        statusColor = Colors.orange;
        statusIcon = Icons.schedule;
        break;
      case "onProgress":
        statusColor = Colors.blue;
        statusIcon = Icons.sync;
        break;
      case "completed":
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help_outline;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(statusIcon, color: statusColor, size: 20),
        const SizedBox(width: 6),
        Text(
          status,
          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
