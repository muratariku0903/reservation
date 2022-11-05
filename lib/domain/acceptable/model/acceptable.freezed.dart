// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'acceptable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Acceptable {
  int get officeCode => throw _privateConstructorUsedError;
  List<TimeAcceptable> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AcceptableCopyWith<Acceptable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptableCopyWith<$Res> {
  factory $AcceptableCopyWith(
          Acceptable value, $Res Function(Acceptable) then) =
      _$AcceptableCopyWithImpl<$Res, Acceptable>;
  @useResult
  $Res call({int officeCode, List<TimeAcceptable> list});
}

/// @nodoc
class _$AcceptableCopyWithImpl<$Res, $Val extends Acceptable>
    implements $AcceptableCopyWith<$Res> {
  _$AcceptableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeCode = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      officeCode: null == officeCode
          ? _value.officeCode
          : officeCode // ignore: cast_nullable_to_non_nullable
              as int,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TimeAcceptable>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AcceptableCopyWith<$Res>
    implements $AcceptableCopyWith<$Res> {
  factory _$$_AcceptableCopyWith(
          _$_Acceptable value, $Res Function(_$_Acceptable) then) =
      __$$_AcceptableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int officeCode, List<TimeAcceptable> list});
}

/// @nodoc
class __$$_AcceptableCopyWithImpl<$Res>
    extends _$AcceptableCopyWithImpl<$Res, _$_Acceptable>
    implements _$$_AcceptableCopyWith<$Res> {
  __$$_AcceptableCopyWithImpl(
      _$_Acceptable _value, $Res Function(_$_Acceptable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeCode = null,
    Object? list = null,
  }) {
    return _then(_$_Acceptable(
      officeCode: null == officeCode
          ? _value.officeCode
          : officeCode // ignore: cast_nullable_to_non_nullable
              as int,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TimeAcceptable>,
    ));
  }
}

/// @nodoc

class _$_Acceptable implements _Acceptable {
  const _$_Acceptable(
      {required this.officeCode, final List<TimeAcceptable> list = const []})
      : _list = list;

  @override
  final int officeCode;
  final List<TimeAcceptable> _list;
  @override
  @JsonKey()
  List<TimeAcceptable> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'Acceptable(officeCode: $officeCode, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Acceptable &&
            (identical(other.officeCode, officeCode) ||
                other.officeCode == officeCode) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, officeCode, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AcceptableCopyWith<_$_Acceptable> get copyWith =>
      __$$_AcceptableCopyWithImpl<_$_Acceptable>(this, _$identity);
}

abstract class _Acceptable implements Acceptable {
  const factory _Acceptable(
      {required final int officeCode,
      final List<TimeAcceptable> list}) = _$_Acceptable;

  @override
  int get officeCode;
  @override
  List<TimeAcceptable> get list;
  @override
  @JsonKey(ignore: true)
  _$$_AcceptableCopyWith<_$_Acceptable> get copyWith =>
      throw _privateConstructorUsedError;
}
