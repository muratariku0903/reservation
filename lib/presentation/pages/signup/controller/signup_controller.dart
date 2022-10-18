import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../application/user/user_service.dart';
import '../../../../infra/user/factory/user_factory_impl.dart';
import '../../../../infra/user/repository/user_repository_impl.dart';
import '../state/signup_state.dart';

final signUpControllerProvider = StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
  (ref) => SignUpController(
    state: const SignUpState(),
    service: UserService(
      factory: UserFactoryImpl(),
      repository: UserRepositoryImpl(),
    ),
  ),
);

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController({
    required SignUpState state,
    required this.service,
  }) : super(state);

  final UserService service;
  final Logger logger = Logger();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    state = state.copyWith(status: SignUpStatus.waiting);

    try {
      service.add(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );
      state = state.copyWith(status: SignUpStatus.success);
    } catch (e) {
      state = state.copyWith(status: SignUpStatus.error);
    }
  }
}
