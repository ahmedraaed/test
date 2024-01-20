import 'package:json_annotation/json_annotation.dart';

part 'AuthenticateResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthenticateResponse {
  AuthenticateResponse();
  String? FullName;
  String? ImageURL;
  int? Fk_AccountState;

  factory AuthenticateResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateResponseToJson(this);
}
