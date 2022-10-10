import '../../../domain/user/model/user.dart';
import '../../../domain/user/repository/user_repository_base.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<void> add(User user) async {}

  @override
  Future<User> fetch(String id) async {
    return const User();
  }
}
