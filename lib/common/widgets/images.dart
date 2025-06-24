import 'package:flutter/widgets.dart';

class Images {
  //Assets Image
  Widget assetsImageByPath(String path, double height, double width) {
    return Image.asset(
      path,
      height: height,
      width: width,
    );
  }

  //Network Image
  Widget networkImageByPath(String url, double height, double width) {
    return Image.network(
      url,
      height: height,
      width: width,
    );
  }
}
