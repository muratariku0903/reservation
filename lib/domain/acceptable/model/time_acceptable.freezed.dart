// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_acceptable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeAcceptable _$TimeAcceptableFromJson(Map<String, dynamic> json) {
  return _TimeAcceptable.fromJson(json);
}

/// @nodoc
mixin _$TimeAcceptable {
  @JsonKey(name: 'office_code')
  int get officeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'start')
  int get start => throw _privateConstructorUsedError;
  @JsonKey(name: 'end')
  int get end => throw _privateConstructorUsedError;
  @JsonKey(name: 'register_cnt')
  int get registerCnt => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_register_cnt')
  int get maxRegisterCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeAcceptableCopyWith<TimeAcceptable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeAcceptableCopyWith<$Res> {
  factory $TimeAcceptableCopyWith(
          TimeAcceptable value, $Res Function(TimeAcceptable) then) =
      _$TimeAcceptableCopyWithImpl<$Res, TimeAcceptable>;
  @useResult
  $Res call(
      {@JsonKey(name: 'office_code') int officeCode,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'start') int start,
      @JsonKey(name: 'end') int end,
      @JsonKey(name: 'register_cnt') int registerCnt,
      @JsonKey(name: 'max_register_cnt') int maxRegisterCnt});
}

/// @nodoc
class _$TimeAcceptableCopyWithImpl<$Res, $Val extends TimeAcceptable>
    implements $TimeAcceptableCopyWith<$Res> {
  _$TimeAcceptableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeCode = null,
    Object? date = null,
    Object? start = null,
    Object? end = null,
    Object? registerCnt = null,
    Object? maxRegisterCnt = null,
  }) {
    return _then(_value.copyWith(
      officeCode: null == officeCode
          ? _value.officeCode
          : officeCode // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
      registerCnt: null == registerCnt
          ? _value.registerCnt
          : registerCnt // ignore: cast_nullable_to_non_nullable
              as int,
      maxRegisterCnt: null == maxRegisterCnt
          ? _value.maxRegisterCnt
          : maxRegisterCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeAcceptableCopyWith<$Res>
    implements $TimeAcceptableCopyWith<$Res> {
  factory _$$_TimeAcceptableCopyWith(
          _$_TimeAcceptable value, $Res Function(_$_TimeAcceptable) then) =
      __$$_TimeAcceptableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'office_code') int officeCode,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'start') int start,
      @JsonKey(name: 'end') int end,
      @JsonKey(name: 'register_cnt') int registerCnt,
      @JsonKey(name: 'max_register_cnt') int maxRegisterCnt});
}

/// @nodoc
class __$$_TimeAcceptableCopyWithImpl<$Res>
    extends _$TimeAcceptableCopyWithImpl<$Res, _$_TimeAcceptable>
    implements _$$_TimeAcceptableCopyWith<$Res> {
  __$$_TimeAcceptableCopyWithImpl(
      _$_TimeAcceptable _value, $Res Function(_$_TimeAcceptable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeCode = null,
    Object? date = null,
    Object? start = null,
    Object? end = null,
    Object? registerCnt = null,
    Object? maxRegisterCnt = null,
  }) {
    return _then(_$_TimeAcceptable(
      officeCode: null == officeCode
          ? _value.officeCode
          : officeCode // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
      registerCnt: null == registerCnt
          ? _value.registerCnt
          : registerCnt // ignore: cast_nullable_to_non_nullable
              as int,
      maxRegisterCnt: null == maxRegisterCnt
          ? _value.maxRegisterCnt
          : maxRegisterCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeAcceptable extends _TimeAcceptable {
  const _$_TimeAcceptable(
      {@JsonKey(name: 'office_code') required this.officeCode,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'start') required this.start,
      @JsonKey(name: 'end') required this.end,
      @JsonKey(name: 'register_cnt') required this.registerCnt,
      @JsonKey(name: 'max_register_cnt') required this.maxRegisterCnt})
      : super._();

  factory _$_TimeAcceptable.fromJson(Map<String, dynamic> json) =>
      _$$_TimeAcceptableFromJson(json);

  @override
  @JsonKey(name: 'office_code')
  final int officeCode;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'start')
  final int start;
  @override
  @JsonKey(name: 'end')
  final int end;
  @override
  @JsonKey(name: 'register_cnt')
  final int registerCnt;
  @override
  @JsonKey(name: 'max_register_cnt')
  final int maxRegisterCnt;

  @override
  String toString() {
    return 'TimeAcceptable(officeCode: $officeCode, date: $date, start: $start, end: $end, registerCnt: $registerCnt, maxRegisterCnt: $maxRegisterCnt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeAcceptable &&
            (identical(other.officeCode, officeCode) ||
                other.officeCode == officeCode) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.registerCnt, registerCnt) ||
                other.registerCnt == registerCnt) &&
            (identical(other.maxRegisterCnt, maxRegisterCnt) ||
                other.maxRegisterCnt == maxRegisterCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, officeCode, date, start, end, registerCnt, maxRegisterCnt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeAcceptableCopyWith<_$_TimeAcceptable> get copyWith =>
      __$$_TimeAcceptableCopyWithImpl<_$_TimeAcceptable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeAcceptableToJson(
      this,
    );
  }
}

abstract class _TimeAcceptable extends TimeAcceptable {
  const factory _TimeAcceptable(
      {@JsonKey(name: 'office_code')
          required final int officeCode,
      @JsonKey(name: 'date')
          required final String date,
      @JsonKey(name: 'start')
          required final int start,
      @JsonKey(name: 'end')
          required final int end,
      @JsonKey(name: 'register_cnt')
          required final int registerCnt,
      @JsonKey(name: 'max_register_cnt')
          required final int maxRegisterCnt}) = _$_TimeAcceptable;
  const _TimeAcceptable._() : super._();

  factory _TimeAcceptable.fromJson(Map<String, dynamic> json) =
      _$_TimeAcceptable.fromJson;

  @override
  @JsonKey(name: 'office_code')
  int get officeCode;
  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'start')
  int get start;
  @override
  @JsonKey(name: 'end')
  int get end;
  @override
  @JsonKey(name: 'register_cnt')
  int get registerCnt;
  @override
  @JsonKey(name: 'max_register_cnt')
  int get maxRegisterCnt;
  @override
  @JsonKey(ignore: true)
  _$$_TimeAcceptableCopyWith<_$_TimeAcceptable> get copyWith =>
      throw _privateConstructorUsedError;
}
