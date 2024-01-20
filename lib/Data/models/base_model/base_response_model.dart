

import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';


@JsonSerializable(explicitToJson: true)
class BaseResponseModel{
  @JsonKey(includeIfNull: false)
  int? id;
  @JsonKey(includeIfNull: false)
  String? createdAt;
  @JsonKey(includeIfNull: false)
  String? createdAtString;
  @JsonKey(includeIfNull: false)
  String? createdBy;
  @JsonKey(includeIfNull: false)
  String? lastModifiedAt;
  @JsonKey(includeIfNull: false)
  String? lastModifiedAtString;
  @JsonKey(includeIfNull: false)
  String? lastModifiedBy;
  @JsonKey(includeIfNull: false)
  String? imageUrl;
  @JsonKey(includeIfNull: false)
  String? storageUrl;
  @JsonKey(includeIfNull: false)
  String? name;
  @JsonKey(includeIfNull: false)
  String? colorCode;
  @JsonKey(includeIfNull: false)
  int? timeZoneOffset;
  @JsonKey(includeIfNull: false)
  int? hotelsCount;





  BaseResponseModel();


  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);


  static List<BaseResponseModel> toList(dynamic jsonArray) =>
      List<Map<String, dynamic>>.from(jsonArray)
          .map(BaseResponseModel.fromJson)
          .toList();

  Map<String, dynamic> toJson() => _$BaseResponseModelToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return name??"";
  }
}