import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../application/acceptable/acceptable_service.dart';
import '../../../../domain/acceptable/model/time_acceptable.dart';
import '../../../../infra/acceptable/repository/acceptable_repository_impl.dart';
import '../state/reservation_state.dart';

final reservationControllerProvider = StateNotifierProvider<ReservationController, ReservationState>(
  (ref) => ReservationController(
    state: const ReservationState(),
    service: AcceptableService(
      repository: AcceptableRepositoryImpl(),
    ),
  ),
);

class ReservationController extends StateNotifier<ReservationState> {
  ReservationController({
    required ReservationState state,
    required this.service,
  }) : super(state);

  final Logger logger = Logger();
  final AcceptableService service;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> reservation() async {}

  Future<List<TimeAcceptable>> fetchAcceptableList(int officeCode) async {
    try {
      List<TimeAcceptable> res = await service.fetch(officeCode);
      print(res.length);
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
