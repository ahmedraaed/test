import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data/apis/SurveyApis.dart';
import '../../../utils/MyEnum.dart';

Future<void> RefreshSurveys() async {
  await getAllSurveyDataApi().then((value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final valueToString = jsonEncode(value);
    prefs.setString(SharedPreferenceKeys.surveyData, valueToString);
  }).onError((error, stackTrace) {
    print(error.toString());
  });
}
