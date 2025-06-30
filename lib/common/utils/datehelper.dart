
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

  List<String> getFormattedCurrentWeekDates() {
    DateTime today = DateTime.now();
    int currentWeekday = today.weekday; // 1 = Monday, ..., 7 = Sunday

    // Get the Monday of the current week
    DateTime monday = today.subtract(Duration(days: currentWeekday - 1));

    // Generate and format 6 days of the week from Monday to Saturday
    List<String> formattedWeek = List.generate(6, (index) {
      DateTime date = monday.add(Duration(days: index));
      return DateFormat('dd/MM').format(date);
    });

    return formattedWeek;
  }

  String getFormattedTodayDate() {
    DateTime today = DateTime.now();
    return DateFormat('dd/MM').format(today);
  }

  String getTaskStatus(String startTimeStr, String endTimeStr) {
    final now = DateTime.now();

    // Format: 08:00AM
    final format = DateFormat('hh:mm');

    final todayStart = format.parse(startTimeStr);
    final todayEnd = format.parse(endTimeStr);

    // Combine with today’s date to form a full DateTime object
    final startTime = DateTime(now.year, now.month, now.day, todayStart.hour, todayStart.minute);
    final endTime = DateTime(now.year, now.month, now.day, todayEnd.hour, todayEnd.minute);

    if (now.isBefore(startTime)) {
      return "pending";
    } else if (now.isAfter(startTime) && now.isBefore(endTime)) {
      return "onProgress";
    } else {
      return "completed";
    }
  }
  //today's day in short - mon,tue,wed...
  String getTodayDay() {
    DateTime now = DateTime.now();
    List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    String today = weekdays[now.weekday - 1]; // weekday is 1 (Mon) to 7 (Sun)
    return today;
  }
}
