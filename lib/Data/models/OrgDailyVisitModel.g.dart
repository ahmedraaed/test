// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrgDailyVisitModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgDailyVisitModel _$OrgDailyVisitModelFromJson(Map<String, dynamic> json) =>
    OrgDailyVisitModel()
      ..Date = json['Date'] as String?
      ..ActualTarget = json['ActualTarget'] as int?
      ..ActualVisitsCount = json['ActualVisitsCount'] as int?
      ..VisitsCount = json['VisitsCount'] as int?
      ..Target = json['Target'] as int?;

Map<String, dynamic> _$OrgDailyVisitModelToJson(OrgDailyVisitModel instance) =>
    <String, dynamic>{
      'Date': instance.Date,
      'ActualTarget': instance.ActualTarget,
      'ActualVisitsCount': instance.ActualVisitsCount,
      'VisitsCount': instance.VisitsCount,
      'Target': instance.Target,
    };
