import 'package:flutter/widgets.dart';

class Devicesize {
  //get Device height
  double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  //get Device width
  double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
