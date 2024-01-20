import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Data/models/OrgDailyVisitModel.dart';
import '../../../shared/sizes.dart';
import '../../../utils/CustomLoading.dart';
import '../../../utils/CustomProgressLoading.dart';
import '../../../utils/MyLanguages.dart';
import 'AnalysisProvider.dart';

class Analysis extends StatefulWidget {
  @override
  _AnalysisState createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          MyLanguageKeys.analysis.toString().tr,
        ),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<AnalysisProvider>(
            create: (_) => AnalysisProvider(),
            builder: (context, _) {
              var analysisProvider = Provider.of<AnalysisProvider>(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      showDateRangePicker(
                        context: context,
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        initialDateRange: DateTimeRange(
                          start: analysisProvider.startDate,
                          end: analysisProvider.endDate,
                        ),
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.light().copyWith(),
                            child: child!,
                          );
                        },
                      ).then((value) {
                        analysisProvider.checkRange(value, context);
                      });
                    },
                    child: Text(MyLanguageKeys.choosePeriod.toString().tr),
                  ).marginSymmetric(vertical: MySizes.defaultMargin),
                  Text(
                      analysisProvider
                          .getFormattedDate(analysisProvider.startDate) +" - "+
                      analysisProvider
                          .getFormattedDate(analysisProvider.endDate),style: Theme.of(context).textTheme.headline6,),
                  Expanded(
                    child: FutureBuilder<List<OrgDailyVisitModel>>(
                        future: analysisProvider.dailyVisitFuture,
                        builder: (_, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return CustomProgressLoading()
                                .showIndicator(context);
                          else {
                            List<OrgDailyVisitModel> list = snapshot.data ?? [];
                            int totalSurvey = 0;
                            list.forEach((element) {
                              totalSurvey += element.ActualVisitsCount!;
                            });
                            return Column(
                              children: [
                                Text(
                                  MyLanguageKeys.totalSurvies.toString().tr +
                                      ": " +
                                      totalSurvey.toString(),
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w300
                                  ),
                                ).marginSymmetric(
                                    vertical: MySizes.defaultMargin),
                                Divider(
                                  height: 10,
                                  thickness: 5,
                                ),
                                Expanded(
                                  child: list.isEmpty
                                      ? emptyListWidget(context)
                                          .marginSymmetric(
                                              vertical: MySizes.defaultMargin)
                                      : ListView.separated(
                                          separatorBuilder: (_, __) {
                                            return Divider();
                                          },
                                          itemBuilder: (_, index) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  analysisProvider.getFormattedDate(analysisProvider.serverFormat.parse(list[index].Date!)) + " - ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                ),
                                                Text(
                                                  MyLanguageKeys.totalSurvies
                                                          .toString()
                                                          .tr +
                                                      ": " +
                                                      list[index]
                                                          .ActualVisitsCount!
                                                          .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                    fontWeight: FontWeight.w300,
                                                      ),
                                                ),
                                              ],
                                            );
                                          },
                                          itemCount: list.length),
                                ),
                              ],
                            );
                          }
                        }),
                  ),
                  /*   Column(
                  children: [
                    Text(
                      MyLanguageKeys.last6month.toString().tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Container(height: 200, child: Last6Months()),
                  ],
                ),
*/
                ],
              );
            }),
      ),
    );
  }
}
