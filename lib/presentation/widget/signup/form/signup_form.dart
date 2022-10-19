import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../pages/signup/controller/signup_controller.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final signUpController = ref.watch(signUpControllerProvider.notifier);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: signUpController.nameController,
                decoration: const InputDecoration(hintText: 'username'),
                validator: (value) => value!.trim().isEmpty ? 'Please input valid username' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: signUpController.emailController,
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (value) => value!.contains('@') ? null : 'Please input valid email',
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: signUpController.passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
                validator: (value) => value!.length < 6 ? 'Please input valid length password' : null,
              ),
              const SizedBox(height: 28),
              ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
