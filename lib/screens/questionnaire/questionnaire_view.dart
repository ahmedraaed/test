import 'package:Des/screens/questionnaire/widget/choice_question.dart';
import 'package:Des/screens/questionnaire/widget/multi_choice_question.dart';
import 'package:Des/screens/questionnaire/widget/multi_selected.dart';
import 'package:Des/screens/questionnaire/widget/number_question.dart';
import 'package:Des/screens/questionnaire/widget/text_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Data/models/QuestionModel.dart';
import '../../Data/models/QuestionViewModel.dart';
import '../../utils/MyLanguages.dart';

class QuestionnaireView extends StatelessWidget {
  const QuestionnaireView({Key? key}) : super(key: key);
  // QuestionViewModel questionViewModel=QuestionViewModel(QuestionModel(),yesNoAnswers: [AnswerModel()],answer: [],note: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("استبيان")),
      body: Container(
        padding: EdgeInsetsDirectional.only(start: 20.w,end: 20.w,bottom: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Align(alignment: AlignmentDirectional.centerStart,child: Text("Questionnaire Type",style:Theme.of(context).textTheme.titleMedium)),
              SizedBox(height: 20.h,),
              Text("description",style:Theme.of(context).textTheme.bodyMedium),

              SizedBox(height: 20.h,),

              Text('how are you ?',
                style: Theme.of(context)
                    .textTheme
                    .headline6,
              ),
              SizedBox(height: 20.h,),
              ChoiceQuestionnaireComponent(question: QuestionViewModel(QuestionModel())),
              SizedBox(height: 10.h,),
              TextFormField(
                enableSuggestions: false,
                onChanged: (notes) {

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

              Divider(height: 50, thickness: 1,),
              Text('how are you ?',
                style: Theme.of(context)
                    .textTheme
                    .headline6,
              ),
              SizedBox(height: 10.h,),

              MultiSelectedComponent(),
              SizedBox(height: 10.h,),

              TextFormField(
                enableSuggestions: false,
                onChanged: (notes) {

                },
                autocorrect: false,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!,
                decoration: InputDecoration(
                  labelText:"note",
                ),
              ).marginSymmetric(),
              Divider(height: 50, thickness: 1,),
              Text('how are you ?',
                style: Theme.of(context)
                    .textTheme
                    .headline6,
              ),
              SizedBox(height: 10.h,),

              NumberQuestionnaireComponent(),
              SizedBox(height: 20.h,),

              TextFormField(
                enableSuggestions: false,
                onChanged: (notes) {

                },
                autocorrect: false,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!,
                decoration: InputDecoration(
                  labelText: "note",
                ),
              ).marginSymmetric(),
              Divider(height: 50, thickness: 1,),
              Text('how are you ?',
                style: Theme.of(context)
                    .textTheme
                    .headline6,
              ),
              SizedBox(height: 10.h,),

              TextQuestionnaireComponent(),
              SizedBox(height: 20.h,),

              TextFormField(
                enableSuggestions: false,
                onChanged: (notes) {

                },
                autocorrect: false,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!,
                decoration: InputDecoration(
                  labelText: "note",
                ),
              ).marginSymmetric(),
              Divider(height: 50, thickness: 1,),

             Text('how are you ?',
                style: Theme.of(context)
                    .textTheme
                    .headline6,
              ),
              SizedBox(height: 10.h,),

              MultiChoiceQuestionnaireComponent(),
              SizedBox(height: 20.h,),

              TextFormField(
                enableSuggestions: false,
                onChanged: (notes) {

                },
                autocorrect: false,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!,
                decoration: InputDecoration(
                  labelText: "note",
                ),
              ).marginSymmetric(),
              Divider(height: 50, thickness: 1,),



            ],
          ),
        ),
      ),
    );
  }
}
