import 'package:freezed_annotation/freezed_annotation.dart';

part 'acceptable.freezed.dart';

@freezed
class Acceptable with _$Acceptable {
  const factory Acceptable({
    @Default('') String departmentId,
    @Default({}) Map<int, DateAcceptable> data,
  }) = _Acceptable;
}

class DateAcceptable {
  DateAcceptable({
    required this.items,
  });
  final List<TimeAcceptable> items;

  bool isAcceptable() {
    return level() > 0;
  }

  int level() {
    int total = 0;
    for (TimeAcceptable item in items) {
      total += item.level;
    }

    return total ~/ items.length;
  }
}

class TimeAcceptable {
  TimeAcceptable({
    required this.startDate,
    required this.endDate,
    required this.level,
  });
  final int startDate;
  final int endDate;
  final int level;

  int year() {
    return DateTime.fromMillisecondsSinceEpoch(startDate).year;
  }

  int month() {
    return DateTime.fromMillisecondsSinceEpoch(startDate).month;
  }

  int day() {
    return DateTime.fromMillisecondsSinceEpoch(startDate).day;
  }

  int startHour() {
    return DateTime.fromMillisecondsSinceEpoch(startDate).hour;
  }

  int endHour() {
    return DateTime.fromMillisecondsSinceEpoch(endDate).hour;
  }
}
