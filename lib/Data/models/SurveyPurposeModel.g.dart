// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SurveyPurposeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyPurposeModel _$SurveyPurposeModelFromJson(Map<String, dynamic> json) =>
    SurveyPurposeModel()
      ..Id = json['Id'] as int
      ..CreatedAtString = json['CreatedAtString'] as String?
      ..CreatedBy = json['CreatedBy'] as String?
      ..Name = json['Name'] as String?
      ..LastModifiedAtString = json['LastModifiedAtString'] as String?
      ..LastModifiedBy = json['LastModifiedBy'] as String?
      ..Questions = (json['Questions'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SurveyPurposeModelToJson(SurveyPurposeModel instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'CreatedAtString': instance.CreatedAtString,
      'CreatedBy': instance.CreatedBy,
      'Name': instance.Name,
      'LastModifiedAtString': instance.LastModifiedAtString,
      'LastModifiedBy': instance.LastModifiedBy,
      'Questions': instance.Questions?.map((e) => e.toJson()).toList(),
    };
