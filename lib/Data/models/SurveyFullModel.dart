import 'package:json_annotation/json_annotation.dart';

import 'AnswerModel.dart';
import 'SurveyPurposeModel.dart';

part 'SurveyFullModel.g.dart';

@JsonSerializable(explicitToJson: true)
class SurveyFullModel {
  SurveyFullModel();
  List<SurveyPurposeModel>? SurveyPurposes;
  List<AnswerModel>? Answers;

  factory SurveyFullModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyFullModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyFullModelToJson(this);
}
