import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday.freezed.dart';
part 'holiday.g.dart';

@freezed
class Holiday with _$Holiday {
  const factory Holiday({
    @JsonKey(name: 'office_code') required int officeCode,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'year') required int year,
  }) = _Holiday;

  const Holiday._();

  factory Holiday.fromJson(Map<String, dynamic> json) => _$HolidayFromJson(json);
}
