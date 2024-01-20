import 'package:dinnova/DinnovaEnums.dart';
import 'package:dinnova/api/DinnovaApiController.dart';
import 'package:dinnova/api/DinnovaApiResponse.dart';

import '../models/AccountSurveyCreateModel.dart';
import '../models/AnswerModel.dart';
import '../models/QuestionModel.dart';
import '../models/SurveyFullModel.dart';
import '../models/SurveyPurposeModel.dart';

class GetSurveyPurposesApi {
  DinnovaPagination? pagination;
  Map<String, String> _queryParameters = {};

  Future<List<SurveyPurposeModel>> init({
    int pageNumber = 0,
    int? pageSize = 50,
    String? orderBy,
  }) async {
    _queryParameters["PageNumber"] = pageNumber.toString();
    if (pageSize != null) _queryParameters["PageSize"] = pageSize.toString();
    if (orderBy != null) _queryParameters["OrderBy"] = orderBy.toString();

    return nextPage(isNextPage: false);
  }

  Future<List<SurveyPurposeModel>> nextPage({bool isNextPage = true}) async {
    List<SurveyPurposeModel> result = [];
    await DinnovaApiController(
            isNextPage
                ? pagination!.nextPage!
                : "/api/v1/Survey/GetSurveyPurposes",
            DinnovaRequestTypeEnum.GET)
        .sendRequest(queryParameters: isNextPage ? {} : _queryParameters)
        .then((value) {
      result = (value.objectResponse as List)
          .map((object) => SurveyPurposeModel.fromJson(object))
          .toList();
      pagination = value.pagination;
    }, onError: (errorMsg) {
      throw errorMsg;
    });
    return result;
  }
}

class GetQuestionsApi {
  DinnovaPagination? pagination;
  Map<String, String> _queryParameters = {};

  Future<List<QuestionModel>> init(
      {int pageNumber = 0,
      int? pageSize = 50,
      String? orderBy,
      int? fkSurveyPurpose}) async {
    _queryParameters["PageNumber"] = pageNumber.toString();
    if (pageSize != null) _queryParameters["PageSize"] = pageSize.toString();
    if (orderBy != null) _queryParameters["OrderBy"] = orderBy.toString();
    if (fkSurveyPurpose != null)
      _queryParameters["Fk_SurveyPurpose"] = fkSurveyPurpose.toString();

    return nextPage(isNextPage: false);
  }

  Future<List<QuestionModel>> nextPage({bool isNextPage = true}) async {
    List<QuestionModel> result = [];
    await DinnovaApiController(
            isNextPage ? pagination!.nextPage! : "/api/v1/Survey/GetQuestions",
            DinnovaRequestTypeEnum.GET)
        .sendRequest(queryParameters: isNextPage ? {} : _queryParameters)
        .then((value) {
      result = (value.objectResponse as List)
          .map((object) => QuestionModel.fromJson(object))
          .toList();
      pagination = value.pagination;
    }, onError: (errorMsg) {
      throw errorMsg;
    });
    return result;
  }
}

class GetAnswersApi {
  DinnovaPagination? pagination;
  Map<String, String> _queryParameters = {};

  Future<List<AnswerModel>> init({
    int pageNumber = 0,
    int? pageSize = 50,
    String? orderBy,
  }) async {
    _queryParameters["PageNumber"] = pageNumber.toString();
    if (pageSize != null) _queryParameters["PageSize"] = pageSize.toString();
    if (orderBy != null) _queryParameters["OrderBy"] = orderBy.toString();

    return nextPage(isNextPage: false);
  }

  Future<List<AnswerModel>> nextPage({bool isNextPage = true}) async {
    List<AnswerModel> result = [];
    await DinnovaApiController(
            isNextPage ? pagination!.nextPage! : "/api/v1/Survey/GetAnswers",
            DinnovaRequestTypeEnum.GET)
        .sendRequest(queryParameters: isNextPage ? {} : _queryParameters)
        .then((value) {
      result = (value.objectResponse as List)
          .map((object) => AnswerModel.fromJson(object))
          .toList();
      pagination = value.pagination;
    }, onError: (errorMsg) {
      throw errorMsg;
    });
    return result;
  }
}

Future<bool> postCreateAccountSurveyApi(
    {required AccountSurveyCreateModel model}) async {
  bool result = false;
  await DinnovaApiController(
          "/api/v1/Survey/CreateAccountSurvey", DinnovaRequestTypeEnum.POST)
      .sendRequest(body: model.toJson())
      .then((value) {
    result = value.objectResponse as bool;
  }, onError: (errorMsg) {
    throw errorMsg;
  });
  return result;
}

Future<SurveyFullModel> getAllSurveyDataApi() async {
  SurveyFullModel result = SurveyFullModel();
  await DinnovaApiController("/api/v1/Survey/GetAllSurveyData", DinnovaRequestTypeEnum.GET)
      .sendRequest()
      .then((value) {
    result = SurveyFullModel.fromJson(value.objectResponse);
  }, onError: (errorMsg) {
    throw errorMsg;
  });
  return result;
}
