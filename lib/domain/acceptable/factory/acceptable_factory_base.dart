import '../model/acceptable.dart';

abstract class AcceptableFactoryBase {
  Acceptable create({required String id, required String password, required String name});
}
