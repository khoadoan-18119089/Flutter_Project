class DateTimeController {
  DateTimeController._();

  static String nowDateTime() {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    DateTime now = DateTime.now();
    var hour = format(now.hour);
    var minute = format(now.minute);
    var year = format(now.year);
    var month = months[now.month - 1];
    var day = format(now.day);
    var time = '$month/$day/$year at $hour:$minute';
    return time;
  }

  static String format(int nuber) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return twoDigits(nuber);
  }

  static String formatTime(int nuber) {
    String twoDigits(int n) => n.toString().padLeft(4, "0");
    return twoDigits(nuber);
  }
}
