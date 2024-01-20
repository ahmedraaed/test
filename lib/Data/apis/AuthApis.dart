import 'package:dinnova/DinnovaEnums.dart';
import 'package:dinnova/api/DinnovaApiController.dart';

import '../models/AuthenticateRequest.dart';
import '../models/AuthenticateResponse.dart';

Future<AuthenticateResponse> loginApi(
    AuthenticateRequest authenticateRequest) async {
  AuthenticateResponse result = AuthenticateResponse();
  await DinnovaApiController("/api/v1/Authorization/Login", DinnovaRequestTypeEnum.POST)
      .sendRequest(body: authenticateRequest.toJson())
      .then((value) {
    result = AuthenticateResponse.fromJson(value.objectResponse);
  }, onError: (errorMsg) {
    throw errorMsg;
  });
  return result;
}
