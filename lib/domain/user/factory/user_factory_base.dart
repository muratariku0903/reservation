import '../model/user.dart';

abstract class UserFactoryBase {
  User create({required String id, required String password, required String name});
}
