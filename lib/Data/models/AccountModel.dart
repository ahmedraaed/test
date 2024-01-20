import 'package:json_annotation/json_annotation.dart';

part 'AccountModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountModel  {
  AccountModel();
  String? CreatedAtString;
  String? CreatedBy;
  String? ImageURL;
  String? LastModifiedAtString;
  String? LastModifiedBy;
  String? LastName;
  String? FirstName;
  String? FullName;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
