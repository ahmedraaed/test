// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel()
      ..Id = json['Id'] as int
      ..CreatedAtString = json['CreatedAtString'] as String?
      ..CreatedBy = json['CreatedBy'] as String?
      ..QuestionText = json['QuestionText'] as String?
      ..LastModifiedAtString = json['LastModifiedAtString'] as String?
      ..LastModifiedBy = json['LastModifiedBy'] as String?
      ..Fk_QuestionType = json['Fk_QuestionType'] as int?;

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'CreatedAtString': instance.CreatedAtString,
      'CreatedBy': instance.CreatedBy,
      'QuestionText': instance.QuestionText,
      'LastModifiedAtString': instance.LastModifiedAtString,
      'LastModifiedBy': instance.LastModifiedBy,
      'Fk_QuestionType': instance.Fk_QuestionType,
    };
