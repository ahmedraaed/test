import 'package:json_annotation/json_annotation.dart';

import 'AccountSurveyAnswerCreateModel.dart';

part 'AccountSurveyCreateModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountSurveyCreateModel {
  AccountSurveyCreateModel();
  int? Fk_SurveyPurpose;
  String? PatientPhone;
  String? PatientName;
  int? PatientAge;
  int? Fk_Gender;
  String? Notes;
  List<AccountSurveyAnswerCreateModel>? AccountSurveyAnswers;

  factory AccountSurveyCreateModel.fromJson(Map<String, dynamic> json) =>
      _$AccountSurveyCreateModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSurveyCreateModelToJson(this);
}
