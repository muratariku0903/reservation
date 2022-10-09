import '../model/user.dart';

abstract class UserRepository {
  Future<void> add(User user);

  Future<User> fetch(String id);
}
