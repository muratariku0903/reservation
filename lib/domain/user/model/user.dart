import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') String id,
    @Default('') String password,
    @Default('') String name,
  }) = _User;
}
