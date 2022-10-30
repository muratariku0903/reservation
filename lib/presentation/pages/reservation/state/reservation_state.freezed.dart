// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reservation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationState {
  int? get selectedDayMs => throw _privateConstructorUsedError;
  ReservationStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationStateCopyWith<ReservationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationStateCopyWith<$Res> {
  factory $ReservationStateCopyWith(
          ReservationState value, $Res Function(ReservationState) then) =
      _$ReservationStateCopyWithImpl<$Res, ReservationState>;
  @useResult
  $Res call({int? selectedDayMs, ReservationStatus status});
}

/// @nodoc
class _$ReservationStateCopyWithImpl<$Res, $Val extends ReservationState>
    implements $ReservationStateCopyWith<$Res> {
  _$ReservationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDayMs = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      selectedDayMs: freezed == selectedDayMs
          ? _value.selectedDayMs
          : selectedDayMs // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationStateCopyWith<$Res>
    implements $ReservationStateCopyWith<$Res> {
  factory _$$_ReservationStateCopyWith(
          _$_ReservationState value, $Res Function(_$_ReservationState) then) =
      __$$_ReservationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? selectedDayMs, ReservationStatus status});
}

/// @nodoc
class __$$_ReservationStateCopyWithImpl<$Res>
    extends _$ReservationStateCopyWithImpl<$Res, _$_ReservationState>
    implements _$$_ReservationStateCopyWith<$Res> {
  __$$_ReservationStateCopyWithImpl(
      _$_ReservationState _value, $Res Function(_$_ReservationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDayMs = freezed,
    Object? status = null,
  }) {
    return _then(_$_ReservationState(
      selectedDayMs: freezed == selectedDayMs
          ? _value.selectedDayMs
          : selectedDayMs // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
    ));
  }
}

/// @nodoc

class _$_ReservationState implements _ReservationState {
  const _$_ReservationState(
      {this.selectedDayMs = null, this.status = ReservationStatus.none});

  @override
  @JsonKey()
  final int? selectedDayMs;
  @override
  @JsonKey()
  final ReservationStatus status;

  @override
  String toString() {
    return 'ReservationState(selectedDayMs: $selectedDayMs, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationState &&
            (identical(other.selectedDayMs, selectedDayMs) ||
                other.selectedDayMs == selectedDayMs) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDayMs, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationStateCopyWith<_$_ReservationState> get copyWith =>
      __$$_ReservationStateCopyWithImpl<_$_ReservationState>(this, _$identity);
}

abstract class _ReservationState implements ReservationState {
  const factory _ReservationState(
      {final int? selectedDayMs,
      final ReservationStatus status}) = _$_ReservationState;

  @override
  int? get selectedDayMs;
  @override
  ReservationStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationStateCopyWith<_$_ReservationState> get copyWith =>
      throw _privateConstructorUsedError;
}
