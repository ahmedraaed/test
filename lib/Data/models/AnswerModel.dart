import 'package:json_annotation/json_annotation.dart';

part 'AnswerModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AnswerModel {
  AnswerModel();
  int Id = 0;
  String? CreatedAtString;
  String? CreatedBy;
  String? AnswerText;
  String? LastModifiedAtString;
  String? LastModifiedBy;
  int? Fk_QuestionType;
  int? Value;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
