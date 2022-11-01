import '../model/acceptable.dart';

abstract class AcceptableRepositoryBase {
  Future<Map<int, DateAcceptable>> fetch(String id);
}
