import 'package:json_annotation/json_annotation.dart';

part 'QuestionModel.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionModel {
  QuestionModel();
  int Id = 0;
  String? CreatedAtString;
  String? CreatedBy;
  String? QuestionText;
  String? LastModifiedAtString;
  String? LastModifiedBy;
  int? Fk_QuestionType;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
