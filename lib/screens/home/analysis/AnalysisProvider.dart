import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Data/apis/Organizations.dart';
import '../../../Data/models/OrgDailyVisitModel.dart';
import '../../../utils/ErrorWidget.dart';
import '../../../utils/MyLanguages.dart';

class AnalysisProvider extends ChangeNotifier {
  late DateTime startDate;
  late DateTime endDate;
  late Future<List<OrgDailyVisitModel>> dailyVisitFuture;
  final maxRange = 35;
  final localFormat = new DateFormat('d MMMM',Get.locale!.languageCode);
  final serverFormat=DateFormat('dd/MM/yyyy');

  AnalysisProvider() {
    startDate = DateTime.now().subtract(Duration(days: 30));
    endDate = DateTime.now();
    getDailySurvey();
  }

  getDailySurvey() {
    dailyVisitFuture = GetOrganizationDailyVisit().init(
        pageSize: maxRange,
        fromDate: startDate.toString(),
        toDate: endDate.toString());
  }

  checkRange(DateTimeRange? value, BuildContext context) {
    if (value != null) {
      if (value.duration.inDays > 35) {
        CustomAlertDialog().showErrorAlert(
            errorMsg: MyLanguageKeys.cantBeMoreThan.toString().tr,
            context: context);
      } else {
        startDate = value.start;
        endDate = value.end;
        getDailySurvey();
        notifyListeners();
      }
    }
  }

  String getFormattedDate(DateTime time){
    return localFormat.format(time);
  }
}
