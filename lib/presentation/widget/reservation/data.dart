import 'dart:math';

class Availability {
  Availability({
    required this.morning,
    required this.noon,
    required this.afternoon,
  });
  final AvailabilityItem morning;
  final AvailabilityItem noon;
  final AvailabilityItem afternoon;

  String mark() {
    int totalLevel = calcTotalAvailabilityLevel();

    String mark = '';
    if (totalLevel >= 5) {
      mark = '○';
    } else if (totalLevel <= 1) {
      mark = '×';
    } else {
      mark = '△';
    }

    return mark;
  }

  int calcTotalAvailabilityLevel() {
    return morning.availabilityLevel + noon.availabilityLevel + afternoon.availabilityLevel;
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

  int startHour() {
    return DateTime.fromMillisecondsSinceEpoch(startDate).hour;
  }

  int endHour() {
    return DateTime.fromMillisecondsSinceEpoch(endDate).hour;
  }

  int year() {
    return DateTime.fromMillisecondsSinceEpoch(startDate).year;
  }

  int month() {
    return DateTime.fromMillisecondsSinceEpoch(startDate).month;
  }

  int day() {
    return DateTime.fromMillisecondsSinceEpoch(startDate).day;
  }

  String mark() {
    switch (availabilityLevel) {
      case 0:
        return '×';
      case 1:
        return '△';
      case 2:
        return '○';
      default:
        return '';
    }
  }
}

class AvailabilityFactory {
  final int _msPerHour = 60 * 60 * 1000;

  Availability create(int ms) {
    return Availability(
      morning: AvailabilityItem(
        startDate: ms + _msPerHour * 9,
        endDate: ms + _msPerHour * 12,
        availabilityLevel: Random().nextInt(3),
      ),
      noon: AvailabilityItem(
        startDate: ms + _msPerHour * 13,
        endDate: ms + _msPerHour * 15,
        availabilityLevel: Random().nextInt(3),
      ),
      afternoon: AvailabilityItem(
        startDate: ms + _msPerHour * 16,
        endDate: ms + _msPerHour * 18,
        availabilityLevel: Random().nextInt(3),
      ),
    );
  }
}
