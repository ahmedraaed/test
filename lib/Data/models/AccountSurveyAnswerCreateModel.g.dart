// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountSurveyAnswerCreateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSurveyAnswerCreateModel _$AccountSurveyAnswerCreateModelFromJson(
        Map<String, dynamic> json) =>
    AccountSurveyAnswerCreateModel()
      ..Fk_Question = json['Fk_Question'] as int?
      ..Fk_Answer = json['Fk_Answer'] as int?
      ..Notes = json['Notes'] as String?;

Map<String, dynamic> _$AccountSurveyAnswerCreateModelToJson(
        AccountSurveyAnswerCreateModel instance) =>
    <String, dynamic>{
      'Fk_Question': instance.Fk_Question,
      'Fk_Answer': instance.Fk_Answer,
      'Notes': instance.Notes,
    };
