extension DurationToTime on Duration {
  String get getTime {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    if (inHours == 0) {
      return '$twoDigitMinutes:$twoDigitSeconds';
    } else {
      return '${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds';
    }
  }
}

extension StringToDuration on String {
  Duration get parseDuration {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
}

extension IntExt on int {
  String get short {
    double rounded = 0.0;
    num number = 0;
    if (this < 0) return '0';
    if (this > 999 && this <= 999999) {
      rounded = double.parse((this / 1000).toStringAsFixed(1));
      number = rounded == rounded.toInt() ? rounded.toInt() : rounded;
      return '${number}K';
    } else if (this > 999999 && this <= 999999999) {
      rounded = double.parse((this / 1000000).toStringAsFixed(1));
      number = rounded == rounded.toInt() ? rounded.toInt() : rounded;
      return '${number}M';
    } else if (this > 999999999) {
      rounded = double.parse((this / 1000000000).toStringAsFixed(1));
      number = rounded == rounded.toInt() ? rounded.toInt() : rounded;
      return '${number}B';
    } else {
      return toString();
    }
  }
}
