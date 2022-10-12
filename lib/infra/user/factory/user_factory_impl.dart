import '../../../domain/user/model/user.dart';
import '../../../domain/user/factory/user_factory_base.dart';

class UserFactoryImpl implements UserFactoryBase {
  @override
  User create({required String id, required String password, required String name}) {
    return User(id: id, password: password, name: name);
  }
}
