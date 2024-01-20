// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnswerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel()
  ..Id = json['Id'] as int
  ..CreatedAtString = json['CreatedAtString'] as String?
  ..CreatedBy = json['CreatedBy'] as String?
  ..AnswerText = json['AnswerText'] as String?
  ..LastModifiedAtString = json['LastModifiedAtString'] as String?
  ..LastModifiedBy = json['LastModifiedBy'] as String?
  ..Fk_QuestionType = json['Fk_QuestionType'] as int?
  ..Value = json['Value'] as int?;

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'CreatedAtString': instance.CreatedAtString,
      'CreatedBy': instance.CreatedBy,
      'AnswerText': instance.AnswerText,
      'LastModifiedAtString': instance.LastModifiedAtString,
      'LastModifiedBy': instance.LastModifiedBy,
      'Fk_QuestionType': instance.Fk_QuestionType,
      'Value': instance.Value,
    };
