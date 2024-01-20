import 'package:dinnova/api/DinnovaApiController.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/MyEnum.dart';
import '../../utils/SupportingFunctions.dart';
import '../home/Dashboard.dart';
import '../home/Questionnaire/RefreshSurveys.dart';
import 'Login.dart';

checkLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey(SharedPreferenceKeys.token)) {
    bool isConnected = await checkInternet();
    if (isConnected) {
      Auth.reNewToken().then((value) async {
        await RefreshSurveys().then((_) {
          Get.offAll(() => value != null ? Dashboard() : Login());
        });
      });
    } else {
      if (prefs.containsKey(SharedPreferenceKeys.surveyData)) {
        var data = await prefs.getString(SharedPreferenceKeys.surveyData);
        Get.offAll(() => data != null ? Dashboard() : Login());
      }
    }
  } else
    Get.offAll(() => Login());
}
