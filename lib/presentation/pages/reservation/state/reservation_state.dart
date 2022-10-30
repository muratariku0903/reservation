import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_state.freezed.dart';

@freezed
class ReservationState with _$ReservationState {
  const factory ReservationState({
    @Default(null) int? selectedDayMs,
    @Default(ReservationStatus.none) ReservationStatus status,
  }) = _ReservationState;
}

enum ReservationStatus {
  none,
  error,
  success,
  waiting,
}
