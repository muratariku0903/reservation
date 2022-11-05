// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_acceptable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeAcceptable _$$_TimeAcceptableFromJson(Map<String, dynamic> json) =>
    _$_TimeAcceptable(
      officeCode: json['office_code'] as int,
      date: json['date'] as String,
      start: json['start'] as int,
      end: json['end'] as int,
      registerCnt: json['register_cnt'] as int,
      maxRegisterCnt: json['max_register_cnt'] as int,
    );

Map<String, dynamic> _$$_TimeAcceptableToJson(_$_TimeAcceptable instance) =>
    <String, dynamic>{
      'office_code': instance.officeCode,
      'date': instance.date,
      'start': instance.start,
      'end': instance.end,
      'register_cnt': instance.registerCnt,
      'max_register_cnt': instance.maxRegisterCnt,
    };
