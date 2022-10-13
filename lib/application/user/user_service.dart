import '../../domain/user/factory/user_factory_base.dart';
import '../../domain/user/model/user.dart';
import '../../domain/user/repository/user_repository_base.dart';
import 'package:logger/logger.dart';

class UserService {
  UserService({required this.repository, required this.factory});

  final UserRepositoryBase repository;
  final UserFactoryBase factory;
  final Logger logger = Logger();

  Future<void> add({required String email, required String password, required String name}) async {
    final User user = factory.create(id: email, password: password, name: name);

    try {
      await repository.add(user);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<User?> fetch(String id) async {
    User? user;

    try {
      user = await repository.fetch(id);
    } catch (e) {
      logger.e(e);
      rethrow;
    }

    return user;
  }
}
