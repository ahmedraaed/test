import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dinnova/api/DinnovaApiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data/models/AccountSurveyCreateModel.dart';
import '../../../utils/CustomLoading.dart';
import '../../../utils/MyEnum.dart';
import '../../../utils/MyLanguages.dart';
import '../../../utils/MySizes.dart';
import '../../../utils/SupportingFunctions.dart';
import 'QuestionnaireProvider.dart';

class ResendQuestionnaire extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResendQuestionnaireState();
}

class _ResendQuestionnaireState extends State<ResendQuestionnaire> {
  List<AccountSurveyCreateModel> accountSurveyModels = [];
  QuestionnaireProvider provider = QuestionnaireProvider();
  bool isConnected = false;

  @override
  void initState() {
    checkInternet().then((value) {
      isConnected = value;
      if (!value) noInternetDialog(context);
    }).onError((error, stackTrace) {});

    SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            if (prefValue.containsKey(SharedPreferenceKeys.resendForm)) {
              var listString =
                  prefValue.getStringList(SharedPreferenceKeys.resendForm);
              if (listString!.isNotEmpty) {
                listString.forEach((element) {
                  Map<String, dynamic> valueMap = jsonDecode(element);
                  accountSurveyModels
                      .add(AccountSurveyCreateModel.fromJson(valueMap));
                });
              }
            }
            syncData();
          })
        });

    super.initState();
  }

  syncData() async {
    if (accountSurveyModels.isNotEmpty) {
      bool isConnected = await checkInternet();
      if (isConnected)
        await Auth.reNewToken().then((value) {
          provider.saveSurveyAnswers(accountSurveyModels[0]).then((value) {
            setState(() {
              accountSurveyModels.removeAt(0);
              if (accountSurveyModels.isEmpty) {
                SharedPreferences.getInstance().then((pref) {
                  pref.remove(SharedPreferenceKeys.resendForm);
                });
              } else {
                syncData();
              }
            });
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return accountSurveyModels.length == 0
        ? emptyListWidget(context)
        : RefreshIndicator(
            onRefresh: () async {
              setState(() {
                accountSurveyModels.clear();
                initState();
              });
            },
            child: ListView.separated(
              itemCount: accountSurveyModels.length,
              separatorBuilder: (_, __) {
                return Divider();
              },
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MyLanguageKeys.patientName.toString().tr +
                                  " : ${accountSurveyModels[index].PatientName ?? ' - '}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              accountSurveyModels[index].Notes ?? '',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ).marginSymmetric(
                            horizontal: MySizes.defaultMargin * 2),
                      ),
                    ),
                    isConnected
                        ? CircularProgressIndicator()
                            .marginAll(MySizes.defaultMargin)
                        : Container(),
                  ],
                );
              },
            ),
          );
  }

  void noInternetDialog(context) async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext bc) {
          return Center(
            child: Container(
              height: 90,
              width: 300,
              margin: EdgeInsets.all(MySizes.halfMargin),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    height: double.infinity,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            MyLanguageKeys.shouldHaveInternet.toString().tr,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.black),
                          ),
                          Center(
                            child: Container(
                              height: 35,
                              width: 100,
                              child: Center(
                                child: TextButton(
                                  child: Center(
                                      child: Text(
                                          MyLanguageKeys.ok.toString().tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .button!
                                              .copyWith(color: Colors.white))),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  )),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ).marginAll(MySizes.halfMargin),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
