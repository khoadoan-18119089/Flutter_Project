class Methods {
  Methods._();

  static Object? getDataHashMap(
    Map? data,
    String key, {
    Object? defaultValue = '',
  }) {
    if (data == null) return defaultValue;
    dynamic val;
    if (data.containsKey(key)) {
      val = data[key];
      if (val != null && val.toString() != '') {
        return val;
      }
    }
    return defaultValue;
  }

  static String getString(
    Map? data,
    String key, {
    String defaultValue = '',
  }) {
    return getDataHashMap(data, key, defaultValue: defaultValue).toString();
  }

  static int toInt(String? source, {int defaultValue = 0}) {
    if (source == null) return defaultValue;
    return int.tryParse(source) ?? defaultValue;
  }

  static int getInt(
    Map? data,
    String key, {
    int defaultValue = 0,
  }) {
    return toInt(
      getDataHashMap(data, key).toString(),
      defaultValue: defaultValue,
    );
  }

  static double todouble(String? source, {double defaultValue = 0.0}) {
    if (source == null) return defaultValue;
    return double.tryParse(source) ?? defaultValue;
  }

  static double getdoble(
    Map? data,
    String key, {
    double defaultValue = 0.0,
  }) {
    return todouble(
      getDataHashMap(data, key).toString(),
      defaultValue: defaultValue,
    );
  }

  static double round(double d, int r) {
    String s = d.toStringAsFixed(r);
    return double.parse(s);
  }

  static String timeAgoString(DateTime date) {
    var secondsInterval = DateTime.now().difference(date).inSeconds;
    if (secondsInterval < 1.0) {
      return 'ngày bây giờ';
    }
    if (secondsInterval < 60.0) {
      return '$secondsInterval giây trước';
    }
    double minutes = (secondsInterval / 60.0);
    minutes = round(minutes, 1);
    if (minutes < 60.0) {
      return '${minutes.round()} phút trước';
    }
    var hours = round((minutes / 24.0), 1);
    if (hours < 24.0) {
      return '${hours.round()} giờ trước';
    }
    var days = round((hours / 60.0), 1);
    if (days < 7.0) {
      return '${days.round()} ngày trước';
    }
    var weeks = round((days / 7), 1);
    if (weeks < 5.0) {
      return '${weeks.round()} tuần trước';
    }
    var months = round((days / 30.0), 1);
    if (months < 12.0) {
      return '${months.round()} tháng trước';
    }
    var years = round((months / 12.0), 1);
    return '${years.round()} măm trước';
  }

  static DateTime? toDateTime(
    String? source, {
    DateTime? defaultValue,
  }) {
    if (source == null) return defaultValue;
    if (source == 'null' || source.isEmpty || source.length < 8) {
      return defaultValue;
    }
    return DateTime.parse(source);
  }

  static DateTime? getDateTime(
    Map? data,
    String key, {
    DateTime? defaultValue,
  }) {
    return toDateTime(
      getDataHashMap(data, key).toString(),
      defaultValue: defaultValue,
    );
  }

  static Duration? toDuration(String? source, {Duration? defaultValue}) {
    if (source == null) return defaultValue;
    if (source == 'null' || source.isEmpty || source.length < 5) {
      return defaultValue;
    }
    int hours = 0;
    int minutes = 0;
    int microseconds = 0;
    List<String> parts = source.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    microseconds = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: microseconds);
  }

  static Duration? getDuration(
    Map? data,
    String key, {
    Duration? defaultValue,
  }) {
    return toDuration(
      getDataHashMap(data, key).toString(),
      defaultValue: defaultValue,
    );
  }

  static bool toBool(String? source, {bool defaultValue = false}) {
    if (source == null) return false;
    if (source == 'null' || source.isEmpty) return defaultValue;
    return source.toLowerCase() == 'true';
  }

  static bool getBool(
    Map? data,
    String key, {
    bool defaultValue = false,
  }) {
    return toBool(getDataHashMap(data, key).toString(),
        defaultValue: defaultValue);
  }

  static Uri getUri(Map? data, String key) {
    return Uri.parse(getString(data, key));
  }

  static Map<String, Object?> getMap(Map<String, Object?> data, String key) {
    Map<String, Object?> map = {};
    if (data.containsKey(key)) {
      map = data[key] as Map<String, Object?>;
    }
    return map;
  }

  static List<Map<String, Object?>> getList(
    Map<String, Object?> data,
    String key,
  ) {
    List<Map<String, Object?>> lst = [];
    if (data.containsKey(key)) {
      Object? lstObj = data[key];
      if (lstObj == null) return lst;
      if (lstObj is List && lstObj.isNotEmpty) {
        lst.addAll(lstObj.map((e) => e as Map<String, Object?>));
      }
    }
    return lst;
  }

  static T? getObject<T extends Object?>(
    Map<String, Object?> data,
    String key, {
    T? defaultValue,
  }) {
    if (!data.containsKey(key)) return defaultValue;
    return data[key] as T;
  }

  static Map<String, String> objectToMap(Object? data) {
    if (data == null) return {};
    if (data is Map) {
      return data as Map<String, String>;
    }
    return {};
  }
}
