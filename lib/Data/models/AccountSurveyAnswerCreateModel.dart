import 'package:json_annotation/json_annotation.dart';

part 'AccountSurveyAnswerCreateModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountSurveyAnswerCreateModel {
  AccountSurveyAnswerCreateModel();
  int? Fk_Question;
  int? Fk_Answer;
  String? Notes;

  factory AccountSurveyAnswerCreateModel.fromJson(Map<String, dynamic> json) =>
      _$AccountSurveyAnswerCreateModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSurveyAnswerCreateModelToJson(this);
}
