import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../application/user/user_service.dart';
import '../state/signup_state.dart';

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController({
    required SignUpState state,
    required this.service,
  }) : super(state);

  final UserService service;
  final Logger logger = Logger();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signUp() async {
    state = state.copyWith(status: SignUpStatus.waiting);

    try {
      service.add(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
      );
      state = state.copyWith(status: SignUpStatus.success);
    } catch (e) {
      state = state.copyWith(status: SignUpStatus.error);
    }
  }
}
