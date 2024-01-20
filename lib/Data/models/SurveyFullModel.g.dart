// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SurveyFullModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyFullModel _$SurveyFullModelFromJson(Map<String, dynamic> json) =>
    SurveyFullModel()
      ..SurveyPurposes = (json['SurveyPurposes'] as List<dynamic>?)
          ?.map((e) => SurveyPurposeModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..Answers = (json['Answers'] as List<dynamic>?)
          ?.map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SurveyFullModelToJson(SurveyFullModel instance) =>
    <String, dynamic>{
      'SurveyPurposes':
          instance.SurveyPurposes?.map((e) => e.toJson()).toList(),
      'Answers': instance.Answers?.map((e) => e.toJson()).toList(),
    };
