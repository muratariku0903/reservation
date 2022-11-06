import '../model/time_acceptable.dart';

abstract class TimeAcceptableRepositoryBase {
  Future<Map<String, TimeAcceptable>> fetch(int officeCode, DateTime day);
}
