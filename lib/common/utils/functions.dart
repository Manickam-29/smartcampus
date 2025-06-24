import 'package:smartcampus/constants/lists.dart';

class Functions {
  String removeTypeFromName(String s, String type) {
    return s.replaceAll(type, '');
  }

  String? getSplashImageUrl(String who) {
    for (var value in splashImages) {
      if (value.containsKey(who)) {
        return value[who];
      }
    }
    return "";
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }
}
