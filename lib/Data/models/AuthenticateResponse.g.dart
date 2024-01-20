// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticateResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateResponse _$AuthenticateResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticateResponse()
      ..FullName = json['FullName'] as String?
      ..ImageURL = json['ImageURL'] as String?
      ..Fk_AccountState = json['Fk_AccountState'] as int?;

Map<String, dynamic> _$AuthenticateResponseToJson(
        AuthenticateResponse instance) =>
    <String, dynamic>{
      'FullName': instance.FullName,
      'ImageURL': instance.ImageURL,
      'Fk_AccountState': instance.Fk_AccountState,
    };
