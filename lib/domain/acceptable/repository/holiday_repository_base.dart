import '../model/holiday.dart';

abstract class HolidayRepositoryBase {
  Future<Map<int, Holiday>> fetch(int officeCode, DateTime day);
}
