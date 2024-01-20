// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticateRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateRequest _$AuthenticateRequestFromJson(Map<String, dynamic> json) =>
    AuthenticateRequest()
      ..Phone = json['Phone'] as String?
      ..Password = json['Password'] as String?;

Map<String, dynamic> _$AuthenticateRequestToJson(
        AuthenticateRequest instance) =>
    <String, dynamic>{
      'Phone': instance.Phone,
      'Password': instance.Password,
    };
