import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data/apis/SurveyApis.dart';
import '../../../Data/models/AccountSurveyCreateModel.dart';
import '../../../Data/models/AnswerModel.dart';
import '../../../Data/models/QuestionModel.dart';
import '../../../Data/models/QuestionViewModel.dart';
import '../../../Data/models/SurveyFullModel.dart';
import '../../../Data/models/SurveyPurposeModel.dart';
import '../../../custom_model/RateModel.dart';
import '../../../utils/MyEnum.dart';
import '../../../utils/MyImages.dart';

class QuestionnaireProvider extends ChangeNotifier {
  bool loading = false;
  List<AnswerModel> answers = [];
  List<String> imagesNames = [
    MyImages.rate1,
    MyImages.rate2,
    MyImages.rate3,
    MyImages.rate4,
    MyImages.rate5,
  ];

  Future<List<SurveyPurposeModel>> getTypesApi() async {
    List<SurveyPurposeModel> types = [];
    await GetSurveyPurposesApi().init().then((value) {
      types = value;
    }).onError((error, stackTrace) {
      throw error.toString();
    });
    return types;
  }

  Future<List<QuestionModel>> getQuestionsApi(int fkType) async {
    List<QuestionModel> questions = [];
    await GetQuestionsApi().init(fkSurveyPurpose: fkType).then((value) {
      questions = value;
    }).onError((error, stackTrace) {
      throw error.toString();
    });
    return questions;
  }

  Future<List<RateModel>> getAnswersApi() async {
    List<AnswerModel> list = [];
    List<RateModel> answersList = [];
    await GetAnswersApi().init().then((value) {
      list = value.reversed.toList();
      for (int i = 0; i < list.length; i++)
        answersList.add(RateModel(list[i].Id, imagesNames[i],
            list[i].AnswerText ?? '', list[i].Value!));
      notifyListeners();
    }).onError((error, stackTrace) {
      throw error.toString();
    });
    return answersList;
  }

  Future<List<QuestionViewModel>> getQuestionsAndAnswersApi(
      SurveyPurposeModel surveyPurposeModel) async {
    List<QuestionModel> questions = [];
    List<QuestionViewModel> QAs = [];
    /*await GetQuestionsApi().init(fkSurveyPurpose: fkType).then((value) async {
      questions = value;
      await getAnswersApi().then((value) {
        for (int i = 0; i < questions.length; i++) {
          List<RateModel> toAdd = [];
          value.forEach((element) {
            toAdd.add(RateModel(element.id, element.image, element.text));
          });
          QAs.add(QuestionViewModel(questions[i], toAdd));
        }
      });
    }).onError((error, stackTrace) {
      throw error.toString();
    });*/
    questions.addAll(surveyPurposeModel.Questions!);
    var list = answers.reversed.toList();
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].Fk_QuestionType == QuestionTypeEnum.Rate) {
        List<RateModel> toAdd = [];
        int imageIndex = 0;
        for (int j = 0; j < list.length; j++) {
          if (list[j].Fk_QuestionType == QuestionTypeEnum.Rate) {
            toAdd.add(RateModel(list[j].Id, imagesNames[imageIndex],
                list[j].AnswerText ?? '', list[j].Value!));
            imageIndex++;
          }
        }
        QAs.add(QuestionViewModel(
          questions[i],
          answer: toAdd,
        ));
      } else if (questions[i].Fk_QuestionType == QuestionTypeEnum.YesOrNo) {
        List<AnswerModel> yesNo = [];
        for (int j = 0; j < list.length; j++) {
          if (list[j].Fk_QuestionType == QuestionTypeEnum.YesOrNo)
            yesNo.add(list[j]);
        }
        QAs.add(QuestionViewModel(questions[i], yesNoAnswers: yesNo));
      }
    }
    return QAs;
  }

  Future<bool> saveSurveyAnswers(AccountSurveyCreateModel answers) async {
    bool result = false;
    loading = true;
    notifyListeners();
    await postCreateAccountSurveyApi(model: answers).then((value) {
      result = value;
      loading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      loading = false;
      notifyListeners();
      throw error.toString();
    });
    return result;
  }

  Future<SurveyFullModel> checkData() async {
    SurveyFullModel model = SurveyFullModel();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(SharedPreferenceKeys.surveyData);
    if (data != null) {
      Map<String, dynamic> valueMap = jsonDecode(data);
      model = SurveyFullModel.fromJson(valueMap);
      print(model);
      answers = model.Answers!;
    } else {}
    return model;
  }

  double calculateAvg(List<AnswerModel> answers) {
    var totalAnswers = 0;
    var totalDegree = answers.length * 100;
    answers.forEach((element) {
      totalAnswers += element.Value ?? 0;
    });

    return totalDegree >= totalAnswers
        ? (totalAnswers / (totalDegree / 100))
        : 0;
  }
}
