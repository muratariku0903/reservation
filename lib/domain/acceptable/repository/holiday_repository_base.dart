import '../model/holiday.dart';

abstract class HolidayRepositoryBase {
  Future<List<Holiday>> fetch(int officeCode);
}
