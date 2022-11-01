import 'dart:math';

class Availability {
  Availability({
    required this.items,
  });
  final List<AvailabilityItem> items;

  bool isAvailable() {
    return level() > 0;
  }

  int level() {
    int total = 0;
    for (AvailabilityItem item in items) {
      total += item.availabilityLevel;
    }

    return total ~/ items.length;
  }
}

class AvailabilityItem {
  AvailabilityItem({
    required this.startDate,
    required this.endDate,
    required this.availabilityLevel,
  });
  final int startDate;
  final int endDate;
  final int availabilityLevel; // enum使えそう

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

class AvailabilityFactory {
  final int _msPerHour = 60 * 60 * 1000;

  Availability create(int ms) {
    List<AvailabilityItem> items = [];
    if (DateTime.fromMillisecondsSinceEpoch(ms).weekday == DateTime.saturday) {
      items = [
        AvailabilityItem(
          startDate: ms + _msPerHour * 9,
          endDate: ms + _msPerHour * 12,
          availabilityLevel: Random().nextInt(3),
        ),
        AvailabilityItem(
          startDate: ms + _msPerHour * 13,
          endDate: ms + _msPerHour * 18,
          availabilityLevel: Random().nextInt(3),
        ),
      ];
    } else {
      items = [
        AvailabilityItem(
          startDate: ms + _msPerHour * 9,
          endDate: ms + _msPerHour * 12,
          availabilityLevel: Random().nextInt(3),
        ),
        AvailabilityItem(
          startDate: ms + _msPerHour * 13,
          endDate: ms + _msPerHour * 15,
          availabilityLevel: Random().nextInt(3),
        ),
        AvailabilityItem(
          startDate: ms + _msPerHour * 16,
          endDate: ms + _msPerHour * 18,
          availabilityLevel: Random().nextInt(3),
        ),
      ];
    }

    return Availability(items: items);
  }
}

Map<int, Availability> createSampleData(DateTime date) {
  AvailabilityFactory factory = AvailabilityFactory();
  int msPerHour = 1000 * 60 * 60;
  int msPerDay = msPerHour * 24;
  int year = date.year;
  int month = date.month;
  int start = DateTime(year, month, 1).millisecondsSinceEpoch;
  int end = DateTime(year, month + 1, 0).millisecondsSinceEpoch;
  Map<int, Availability> data = {};
  for (var ms = start; ms <= end; ms += msPerDay) {
    data[ms] = factory.create(ms);
  }

  return data;
}
