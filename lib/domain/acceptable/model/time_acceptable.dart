import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_acceptable.freezed.dart';
part 'time_acceptable.g.dart';

@freezed
class TimeAcceptable with _$TimeAcceptable {
  const factory TimeAcceptable({
    @JsonKey(name: 'office_code') required int officeCode,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'start') required int start,
    @JsonKey(name: 'end') required int end,
    @JsonKey(name: 'register_cnt') required int registerCnt,
    @JsonKey(name: 'max_register_cnt') required int maxRegisterCnt,
  }) = _TimeAcceptable;

  const TimeAcceptable._();

  factory TimeAcceptable.fromJson(Map<String, dynamic> json) => _$TimeAcceptableFromJson(json);
}
