import 'package:json_annotation/json_annotation.dart';

import 'QuestionModel.dart';

part 'SurveyPurposeModel.g.dart';

@JsonSerializable(explicitToJson: true)
class SurveyPurposeModel {
  SurveyPurposeModel();
  int Id = 0;
  String? CreatedAtString;
  String? CreatedBy;
  String? Name;
  String? LastModifiedAtString;
  String? LastModifiedBy;
  List<QuestionModel>? Questions;

  factory SurveyPurposeModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyPurposeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyPurposeModelToJson(this);
}
