import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../state/reservation_state.dart';

final reservationControllerProvider = StateNotifierProvider.autoDispose<ReservationController, ReservationState>(
  (ref) => ReservationController(
    state: const ReservationState(),
  ),
);

class ReservationController extends StateNotifier<ReservationState> {
  ReservationController({
    required ReservationState state,
  }) : super(state);

  final Logger logger = Logger();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> reservation() async {}
}
