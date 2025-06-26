import 'package:flutter/material.dart';
import 'package:smartcampus/common/utils/operations.dart';
import 'package:smartcampus/common/widgets/padding.dart';
import 'package:smartcampus/constants/lists.dart';
import '../../constants/colors.dart';

Widget dashBoardModule(BuildContext context, double h, double w, String label, IconData iconData) {
  return GestureDetector(
    onTap: (){
      int pos = teacherModuleTitles.indexOf(label);
      Operations().teacherDashBoard(context, pos);
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: w * 0.16, // double the radius
          height: w * 0.16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: skyBlue, width: 2),
          ),
          child: Center(
            child: Icon(iconData, size: w * 0.08, color: skyBlue),
          ),
        ),
        CommonPadding.topPadding8,
        Text(
          label,
          style: TextStyle(fontSize: w * 0.035, color: skyBlue),
        ),
      ],
    ),
  );
}
