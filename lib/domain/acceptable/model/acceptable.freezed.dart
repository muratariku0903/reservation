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
  String get departmentId => throw _privateConstructorUsedError;
  Map<int, DateAcceptable> get data => throw _privateConstructorUsedError;

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
  $Res call({String departmentId, Map<int, DateAcceptable> data});
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
    Object? departmentId = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<int, DateAcceptable>,
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
  $Res call({String departmentId, Map<int, DateAcceptable> data});
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
    Object? departmentId = null,
    Object? data = null,
  }) {
    return _then(_$_Acceptable(
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<int, DateAcceptable>,
    ));
  }
}

/// @nodoc

class _$_Acceptable implements _Acceptable {
  const _$_Acceptable(
      {this.departmentId = '', final Map<int, DateAcceptable> data = const {}})
      : _data = data;

  @override
  @JsonKey()
  final String departmentId;
  final Map<int, DateAcceptable> _data;
  @override
  @JsonKey()
  Map<int, DateAcceptable> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'Acceptable(departmentId: $departmentId, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Acceptable &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, departmentId, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AcceptableCopyWith<_$_Acceptable> get copyWith =>
      __$$_AcceptableCopyWithImpl<_$_Acceptable>(this, _$identity);
}

abstract class _Acceptable implements Acceptable {
  const factory _Acceptable(
      {final String departmentId,
      final Map<int, DateAcceptable> data}) = _$_Acceptable;

  @override
  String get departmentId;
  @override
  Map<int, DateAcceptable> get data;
  @override
  @JsonKey(ignore: true)
  _$$_AcceptableCopyWith<_$_Acceptable> get copyWith =>
      throw _privateConstructorUsedError;
}
