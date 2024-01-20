import 'package:json_annotation/json_annotation.dart';

part 'OrgDailyVisitModel.g.dart';

@JsonSerializable(explicitToJson: true)
class OrgDailyVisitModel {
  OrgDailyVisitModel();
  String? Date;
  int? ActualTarget;
  int? ActualVisitsCount;
  int? VisitsCount;
  int? Target;
  factory OrgDailyVisitModel.fromJson(Map<String, dynamic> json) =>
      _$OrgDailyVisitModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrgDailyVisitModelToJson(this);
}
