// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel()

  ..CreatedAtString = json['CreatedAtString'] as String?
  ..CreatedBy = json['CreatedBy'] as String?
  ..ImageURL = json['ImageURL'] as String?
  ..LastModifiedAtString = json['LastModifiedAtString'] as String?
  ..LastModifiedBy = json['LastModifiedBy'] as String?
  ..LastName = json['LastName'] as String?
  ..FirstName = json['FirstName'] as String?
  ..FullName = json['FullName'] as String?;

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{

      'CreatedAtString': instance.CreatedAtString,
      'CreatedBy': instance.CreatedBy,
      'ImageURL': instance.ImageURL,
      'LastModifiedAtString': instance.LastModifiedAtString,
      'LastModifiedBy': instance.LastModifiedBy,
      'LastName': instance.LastName,
      'FirstName': instance.FirstName,
      'FullName': instance.FullName,
    };
