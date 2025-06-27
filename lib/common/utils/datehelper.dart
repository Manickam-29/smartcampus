import 'package:intl/intl.dart';

class DateHelper {
  DateTime stringToDate(String dateStr) {
    return DateTime.parse(dateStr);
  }

  /// Convert a DateTime to string using format type or custom format
  String dateToString(DateTime date) {
    return date.toString();
  }

  String convertToDateFormat(int index, String date) {
    // e.g., June 26, 2025
    if (index == 0) {
      return DateFormat.yMMMMd('en_US').format(stringToDate(date));
    } else {
      return date;
    }
  }

  /// Calculates age from a given date string (format: yyyy-MM-dd)
  String calculateAge(String dateOfBirth) {
    DateTime dob = stringToDate(dateOfBirth);
    DateTime today = DateTime.now();

    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age.toString();
  }
}
