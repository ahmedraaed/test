import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data/models/AccountSurveyAnswerCreateModel.dart';
import '../../../Data/models/AccountSurveyCreateModel.dart';
import '../../../Data/models/AnswerModel.dart';
import '../../../Data/models/QuestionViewModel.dart';
import '../../../utils/MyEnum.dart';
import '../../../utils/MyLanguages.dart';
import '../../../utils/MySizes.dart';
import '../../../utils/SupportingFunctions.dart';
import '../../../utils/WarningBottomSheet.dart';
import '../Dashboard.dart';
import 'QuestionnaireProvider.dart';

class NewQuestionnaire extends StatefulWidget {

  NewQuestionnaire();

  @override
  State<StatefulWidget> createState() => _NewQuestionnaireState();
}

class _NewQuestionnaireState extends State<NewQuestionnaire> {
  late QuestionnaireProvider provider;
  late Future<List<QuestionViewModel>> questionsFuture;
  late int typeId;
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String? selectedGenderString;
  int? age;
  int selectedGenderId = 1;
  List<String> genderOptions = [
    MyLanguageKeys.male.toString().tr,
    MyLanguageKeys.female.toString().tr
  ];

  @override
  void initState() {

    selectedGenderString = MyLanguageKeys.male.toString().tr;
    age = 16;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          MyLanguageKeys.newRate.toString().tr,
        ),
      ),
      body: ChangeNotifierProvider.value(
          value: provider,
          builder: (providerContext, widget) {
            return SafeArea(
              child: FutureBuilder<List<QuestionViewModel>>(
                  future: questionsFuture,
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    if (!snapshot.hasData) return Container();
                    List<QuestionViewModel> questions = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Form(
                                key: _formKey,
                                onChanged: () {
                                  setState(() {});
                                },
                                child: Column(children: [
                                  TextFormField(
                                    controller: nameController,
                                    enableSuggestions: false,
                                    autovalidateMode: AutovalidateMode.always,
                                    autocorrect: false,
                                    style:
                                        Theme.of(context).textTheme.subtitle1!,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      labelText: MyLanguageKeys.enterPatientName
                                          .toString()
                                          .tr,
                                      suffixIcon: IconButton(
                                        icon: Center(
                                          child: Icon(
                                            Icons.person_outline_rounded,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value != null && value.isEmpty)
                                        return MyLanguageKeys.cantEmpty
                                            .toString()
                                            .tr;
                                      else if (value!.isEmpty)
                                        return MyLanguageKeys
                                            .patientNameHintError
                                            .toString()
                                            .tr;
                                    },
                                  ).marginSymmetric(vertical: MySizes.defaultMargin * 2),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: MyLanguageKeys.enterPhoneHint
                                          .toString()
                                          .tr,
                                      suffixIcon: IconButton(
                                        icon: Center(
                                          child: Icon(
                                            Icons.phone,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    controller: mobileNumberController,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    //enabled: false,
                                    keyboardType: TextInputType.phone,
                                    style:
                                        Theme.of(context).textTheme.subtitle1!,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value != null &&
                                          value.isNotEmpty &&
                                          value.length != 11)
                                        return MyLanguageKeys.phoneHintError
                                            .toString()
                                            .tr;
                                    },
                                  ),
                                  TextFormField(
                                    controller: notesController,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    style:
                                        Theme.of(context).textTheme.subtitle1!,
                                    decoration: InputDecoration(
                                      labelText: MyLanguageKeys.enterNotes
                                          .toString()
                                          .tr,
                                    ),
                                  ).marginSymmetric(
                                      vertical: MySizes.defaultMargin * 2),
                                ]),
                              ).marginSymmetric(
                                  horizontal: MySizes.defaultMargin),
                            ],
                          ).marginSymmetric(horizontal: MySizes.defaultMargin),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      MyLanguageKeys.gender.toString().tr,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    VerticalDivider(),
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        hint: Text(
                                          MyLanguageKeys.choose.toString().tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                        value: selectedGenderString,
                                        alignment: Alignment.center,
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedGenderString = value!;
                                            if (selectedGenderString ==
                                                MyLanguageKeys.male
                                                    .toString()
                                                    .tr) {
                                              selectedGenderId =
                                                  GenderEnum.Male;
                                            } else if (MyLanguageKeys.female
                                                    .toString()
                                                    .tr ==
                                                selectedGenderString) {
                                              selectedGenderId =
                                                  GenderEnum.Female;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.black,
                                        ),
                                        items:
                                            genderOptions.map((String model) {
                                          return DropdownMenuItem<String>(
                                            value: model,
                                            child: Text(model,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
                                          );
                                        }).toList(),
                                        validator: (value) {
                                          if (value == null)
                                            return MyLanguageKeys.cantEmpty
                                                .toString()
                                                .tr;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              VerticalDivider(),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(MyLanguageKeys.chooseAge.toString().tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                    VerticalDivider(),
                                    Expanded(
                                      child: numberPicker(
                                          startNumber: 16,
                                          context: context,
                                          endNumber: 80,
                                          preSelceted: 16,
                                          onSelected: (selectedAge) {
                                            age = selectedAge;
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ).marginSymmetric(
                            horizontal: MySizes.defaultMargin * 2,
                            vertical: MySizes.defaultMargin * 2,
                          ),
                          Divider(
                            thickness: 10,
                          ),
                          ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, questionsIndex) {
                                    TextEditingController notes =
                                        TextEditingController(
                                            text:
                                                questions[questionsIndex].note);
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          questions[questionsIndex]
                                                  .questionModel
                                                  .QuestionText ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Container(
                                          height: 80,
                                          margin: EdgeInsets.symmetric(
                                              vertical: MySizes.defaultMargin),
                                          child: questions[questionsIndex]
                                                      .questionModel
                                                      .Fk_QuestionType ==
                                                  QuestionTypeEnum.Rate
                                              ? rateAnswers(
                                                  questions[questionsIndex])
                                              : choiceAnswers(
                                                  questions[questionsIndex]),
                                        ),
                                        TextFormField(
                                          controller: notes,
                                          enableSuggestions: false,
                                          onChanged: (notes) {
                                            questions[questionsIndex].note =
                                                notes;
                                          },
                                          autocorrect: false,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!,
                                          decoration: InputDecoration(
                                            labelText: MyLanguageKeys.enterNotes
                                                .toString()
                                                .tr,
                                          ),
                                        ).marginSymmetric(),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, questionsIndex) {
                                    return Divider(
                                      height: 50,
                                      thickness: 10,
                                      color: questions[questionsIndex]
                                                  .selectedAnswer
                                                  .Id ==
                                              -1
                                          ? Colors.red
                                          : null,
                                    );
                                  },
                                  itemCount: questions.length)
                              .paddingAll(MySizes.defaultMargin),
                          Divider(
                            thickness: 10,
                          ),
                          Container(
                            width: 200,
                            margin: EdgeInsets.symmetric(
                                vertical: MySizes.defaultMargin),
                            child: TextButton(
                                onPressed: () async {
                                  var connectivityResult =
                                      await checkInternet();
                                  if (checkAnswers(questions)) {
                                    AccountSurveyCreateModel model =
                                        AccountSurveyCreateModel();
                                    model.Fk_SurveyPurpose = typeId;
                                    model.Fk_Gender = selectedGenderId;
                                    model.PatientAge = age;
                                    model.Notes = notesController.text;
                                    model.PatientName = nameController.text;
                                    model.PatientPhone =
                                        mobileNumberController.text != ''
                                            ? mobileNumberController.text
                                            : null;
                                    model.AccountSurveyAnswers = [];
                                    questions.forEach((element) {
                                      AccountSurveyAnswerCreateModel answer =
                                          AccountSurveyAnswerCreateModel();
                                      answer.Fk_Question =
                                          element.questionModel.Id;
                                      answer.Fk_Answer =
                                          element.selectedAnswer.Id;
                                      answer.Notes = element.note;
                                      model.AccountSurveyAnswers!.add(answer);
                                    });
                                    confirmDialog(context, questions);
                                    if (connectivityResult) {
                                      provider
                                          .saveSurveyAnswers(model)
                                          .then((value) {})
                                          .onError((error, stackTrace) {
                                        saveRequest(model);
                                      });
                                    } else {
                                      confirmDialog(context, questions);
                                      saveRequest(model);
                                    }
                                  } else {
                                    WarningBottomSheet().init(
                                        context,
                                        MyLanguageKeys.error.toString().tr,
                                        MyLanguageKeys.completeError
                                            .toString()
                                            .tr);
                                  }
                                },
                                child: Text(MyLanguageKeys.send.toString().tr)),
                          )
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }

  bool checkAnswers(List<QuestionViewModel> questions) {
    var isValid = true;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].selectedAnswer == null) {
        isValid = false;
      }
    }
    if (!_formKey.currentState!.validate()) {
      setState(() {
        isValid = false;
      });
    }
    return isValid;
  }

  confirmDialog(context, List<QuestionViewModel> questions) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext bc) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  width: 300,
                  margin: EdgeInsets.all(MySizes.halfMargin),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        MyLanguageKeys.yourRequestIsBeingSent.toString().tr,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                          "نتيجة هذا الاتسبيات: " +
                              provider
                                  .calculateAvg(questions.map((e) {
                                    return e.selectedAnswer;
                                  }).toList())
                                  .toString() +
                              " %",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.black)).marginAll(MySizes.defaultMargin),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            child: Center(
                              child: TextButton(
                                child: Center(
                                    child: Text(
                                        MyLanguageKeys.newSurvey.toString().tr,
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
                                  Get.off(
                                    () => ChangeNotifierProvider.value(
                                        value: provider,
                                        builder: (context, _) {
                                          return NewQuestionnaire();
                                        }),
                                    preventDuplicates: false,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MySizes.halfMargin,
                          ),
                          Container(
                            height: 35,
                            child: Center(
                              child: TextButton(
                                child: Center(
                                    child: Text(
                                        MyLanguageKeys.back.toString().tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .button!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor))),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    )),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Get.offAll(() => Dashboard());
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).marginAll(MySizes.halfMargin),
                ),
              ),
            ],
          );
        });
  }

  Widget rateAnswers(QuestionViewModel question) {
    return ListView.separated(
      separatorBuilder: (context, _) {
        return VerticalDivider();
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, innerIndex) {
        return GestureDetector(
          onTap: () {
            setState(() {
              question.answer![innerIndex].isSelected =
                  !question.answer![innerIndex].isSelected;

              if (question.answer![innerIndex].isSelected) {
                question.selectedAnswer.Id = question.answer![innerIndex].id;
                question.selectedAnswer.Value =
                    question.answer![innerIndex].value;
              } else {
                question.selectedAnswer.Id = -1;
                question.selectedAnswer.Value = 0;
              }

              for (int j = 0; j < question.answer!.length; j++) {
                if (j != innerIndex) {
                  question.answer![j].isSelected = false;
                }
              }
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Opacity(
                  opacity: question.answer![innerIndex].isSelected ? 1 : .3,
                  child: Image.asset(
                    question.answer![innerIndex].image,
                  ),
                ),
              ),
              Text(question.answer![innerIndex].text),
            ],
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: question.answer!.length,
    );
  }

  Widget choiceAnswers(QuestionViewModel question) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: question.yesNoAnswers!.map((answer) {
        return Row(
          children: [
            Radio<AnswerModel>(
                value: answer,
                groupValue: question.selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    question.selectedAnswer = value!;
                  });
                }),
            Text(answer.AnswerText ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.black)),
          ],
        ).marginSymmetric(horizontal: MySizes.defaultMargin);
      }).toList(),
    );
  }

  saveRequest(AccountSurveyCreateModel model) {
    String newModelString = jsonEncode(model);
    SharedPreferences.getInstance().then((sharedPreferences) {
      if (sharedPreferences.containsKey(SharedPreferenceKeys.resendForm)) {
        var listString =
            sharedPreferences.getStringList(SharedPreferenceKeys.resendForm);
        listString!.add(newModelString);
        sharedPreferences.setStringList(
            SharedPreferenceKeys.resendForm, listString);
      } else {
        sharedPreferences
            .setStringList(SharedPreferenceKeys.resendForm, [newModelString]);
      }
    });
  }
}
