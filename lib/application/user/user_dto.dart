import 'package:reservation/domain/user/model/user.dart';

class UserDto {
  UserDto(User user)
      : name = user.name,
        email = user.id,
        password = user.password;

  final String name;
  final String email;
  final String password;
}
