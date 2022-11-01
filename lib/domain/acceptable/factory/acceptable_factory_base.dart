import '../model/acceptable.dart';

abstract class UserFactoryBase {
  Acceptable create({required String id, required String password, required String name});
}
