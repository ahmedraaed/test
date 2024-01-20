// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountSurveyCreateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSurveyCreateModel _$AccountSurveyCreateModelFromJson(
        Map<String, dynamic> json) =>
    AccountSurveyCreateModel()
      ..Fk_SurveyPurpose = json['Fk_SurveyPurpose'] as int?
      ..PatientPhone = json['PatientPhone'] as String?
      ..PatientName = json['PatientName'] as String?
      ..PatientAge = json['PatientAge'] as int?
      ..Fk_Gender = json['Fk_Gender'] as int?
      ..Notes = json['Notes'] as String?
      ..AccountSurveyAnswers = (json['AccountSurveyAnswers'] as List<dynamic>?)
          ?.map((e) => AccountSurveyAnswerCreateModel.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AccountSurveyCreateModelToJson(
        AccountSurveyCreateModel instance) =>
    <String, dynamic>{
      'Fk_SurveyPurpose': instance.Fk_SurveyPurpose,
      'PatientPhone': instance.PatientPhone,
      'PatientName': instance.PatientName,
      'PatientAge': instance.PatientAge,
      'Fk_Gender': instance.Fk_Gender,
      'Notes': instance.Notes,
      'AccountSurveyAnswers':
          instance.AccountSurveyAnswers?.map((e) => e.toJson()).toList(),
    };
