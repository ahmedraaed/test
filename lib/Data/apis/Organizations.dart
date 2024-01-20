
import 'package:dinnova/DinnovaEnums.dart';
import 'package:dinnova/api/DinnovaApiController.dart';
import 'package:dinnova/api/DinnovaApiResponse.dart';

import '../models/OrgDailyVisitModel.dart';

class GetOrganizationDailyVisit {
  DinnovaPagination? pagination;
  Map<String, String> _queryParameters = {};

  Future<List<OrgDailyVisitModel>> init({
    int pageNumber = 0,
    int? pageSize = 20,
    String? orderBy,
    String? toDate,
    String? fromDate,
  }) async {
    _queryParameters["PageNumber"] = pageNumber.toString();
    if (pageSize != null) _queryParameters["PageSize"] = pageSize.toString();
    if (orderBy != null) _queryParameters["OrderBy"] = orderBy.toString();
    if (toDate != null) _queryParameters["ToDate"] = toDate;
    if (fromDate != null) _queryParameters["FromDate"] = fromDate;

    return nextPage(isNextPage: false);
  }

  Future<List<OrgDailyVisitModel>> nextPage({bool isNextPage = true}) async {
    List<OrgDailyVisitModel> result = [];
    await DinnovaApiController(
            isNextPage
                ? pagination!.nextPage!
                : "/api/v1/Organization/GetDailySurveyCount",
            DinnovaRequestTypeEnum.GET)
        .sendRequest(queryParameters: isNextPage ? {} : _queryParameters)
        .then((value) {
      result = (value.objectResponse as List)
          .map((object) => OrgDailyVisitModel.fromJson(object))
          .toList();
      pagination = value.pagination;
    }, onError: (errorMsg) {
      throw errorMsg;
    });
    return result;
  }
}
