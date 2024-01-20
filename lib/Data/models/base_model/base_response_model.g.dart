// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) =>
    BaseResponseModel()
      ..id = json['id'] as int?
      ..createdAt = json['createdAt'] as String?
      ..createdAtString = json['createdAtString'] as String?
      ..createdBy = json['createdBy'] as String?
      ..lastModifiedAt = json['lastModifiedAt'] as String?
      ..lastModifiedAtString = json['lastModifiedAtString'] as String?
      ..lastModifiedBy = json['lastModifiedBy'] as String?
      ..imageUrl = json['imageUrl'] as String?
      ..storageUrl = json['storageUrl'] as String?
      ..name = json['name'] as String?
      ..colorCode = json['colorCode'] as String?
      ..timeZoneOffset = json['timeZoneOffset'] as int?
      ..hotelsCount = json['hotelsCount'] as int?;

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('createdAtString', instance.createdAtString);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('lastModifiedAt', instance.lastModifiedAt);
  writeNotNull('lastModifiedAtString', instance.lastModifiedAtString);
  writeNotNull('lastModifiedBy', instance.lastModifiedBy);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('storageUrl', instance.storageUrl);
  writeNotNull('name', instance.name);
  writeNotNull('colorCode', instance.colorCode);
  writeNotNull('timeZoneOffset', instance.timeZoneOffset);
  writeNotNull('hotelsCount', instance.hotelsCount);
  return val;
}
