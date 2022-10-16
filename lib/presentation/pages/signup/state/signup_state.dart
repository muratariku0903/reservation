import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/user/model/user.dart';

part 'signup_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(User()) User user,
    @Default(SignUpStatus.none) SignUpStatus status,
  }) = _SignUpState;
}

enum SignUpStatus {
  none,
  error,
  success,
  waiting,
}
