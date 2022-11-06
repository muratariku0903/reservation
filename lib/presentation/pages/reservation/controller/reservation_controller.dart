import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../application/acceptable/acceptable_service.dart';
import '../../../../domain/acceptable/model/acceptable.dart';
import '../../../../infra/acceptable/repository/holiday_repository_impl.dart';
import '../../../../infra/acceptable/repository/time_acceptable_repository_impl.dart';
import '../state/reservation_state.dart';

final reservationControllerProvider = StateNotifierProvider<ReservationController, ReservationState>(
  (ref) => ReservationController(
    state: const ReservationState(),
    service: AcceptableService(
      timeAcceptableRepository: TimeAcceptableRepositoryImpl(),
      holidayRepository: HolidayRepositoryImpl(),
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

  Future<Acceptable> fetchAcceptable(int officeCode, DateTime day) async {
    try {
      return await service.fetch(officeCode, day);
    } catch (e) {
      print(e);
      throw ('error');
    }
  }
}
