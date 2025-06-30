import 'package:smartcampus/constants/lists.dart';

class Functions {
  String removeTypeFromName(String s) {
    return s.replaceAll(RegExp(r'\.(jpg|png|gif)$', caseSensitive: false), '');
  }

  String? getImageUrlUsingKey(String key) {
    for (var value in inAppImages) {
      if (value.containsKey(key)) {
        return value[key];
      }
    }
    return "";
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  Map<String, dynamic> combineTwoMapData(
    Map<String, dynamic> map1,
    Map<String, dynamic> map2,
  ) {
    return {...map1, ...map2};
  }

  bool compareTwoDatesSame(String date1, String date2) {
    return date1 == date2;
  }

  String? getTimeSlotForSubject(Map<String, String> timetable, String subject) {
    return timetable.entries
        .firstWhere(
          (entry) => entry.value == subject && entry.key != "Day",
      orElse: () => const MapEntry('', ''),
    )
        .key
        .isNotEmpty
        ? timetable.entries
        .firstWhere(
          (entry) => entry.value == subject && entry.key != "Day",
    )
        .key
        : null;
  }

}
