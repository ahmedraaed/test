import 'package:json_annotation/json_annotation.dart';

part 'AuthenticateRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthenticateRequest {
  AuthenticateRequest();
  String? Phone;
  String? Password;

  factory AuthenticateRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateRequestToJson(this);
}
