import '../model/time_acceptable.dart';

abstract class AcceptableRepositoryBase {
  Future<List<TimeAcceptable>> fetch(int officeCode);
}
