import '../model/user.dart';

abstract class UserRepositoryBase {
  Future<void> add(User user);

  Future<User> fetch(String id);
}
