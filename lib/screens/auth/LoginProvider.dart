import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Data/apis/AuthApis.dart';
import '../../Data/models/AuthenticateRequest.dart';
import '../../Data/models/AuthenticateResponse.dart';
import '../home/Questionnaire/RefreshSurveys.dart';

class LoginProvider extends ChangeNotifier {
  bool loading = false;

  Future<dynamic> signInApi(AuthenticateRequest authenticateRequest) async {
    AuthenticateResponse response = AuthenticateResponse();
    loading = true;
    notifyListeners();
    await loginApi(authenticateRequest).then((value) async {
      await RefreshSurveys().then((_) {
        response = value;
        loading = false;
        notifyListeners();
      });
    }).onError((error, stackTrace) {
      loading = false;
      notifyListeners();
      throw error.toString();
    });
    return response;
  }
}
