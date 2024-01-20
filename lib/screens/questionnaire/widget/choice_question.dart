import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Data/models/AnswerModel.dart';
import '../../../Data/models/QuestionViewModel.dart';
import '../../../shared/sizes.dart';

class ChoiceQuestionnaireComponent extends StatefulWidget {
  ChoiceQuestionnaireComponent({Key? key,required this.question}) : super(key: key);
   QuestionViewModel question;

  @override
  State<ChoiceQuestionnaireComponent> createState() => _Choice_questionnaireState();
}

class _Choice_questionnaireState extends State<ChoiceQuestionnaireComponent> {
  int selectedOption=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            // Radio<AnswerModel>(
            //     value: answer,
            //     groupValue: widget.question.selectedAnswer,
            //     onChanged: (value) {
            //       setState(() {
            //         widget.question.selectedAnswer = value!;
            //       });
            //     }),
            Radio(
              value: 1,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = int.parse(value.toString());
                  print("Button value: $value");
                });
              },
            ),
            Text( 'yse',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge),
          ],
        ).marginSymmetric(horizontal: MySizes.defaultMargin),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = int.parse(value.toString());
                  print("Button value: $value");
                });
              },
            ),

            Text('no',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge),
          ],
        ).marginSymmetric(horizontal: MySizes.defaultMargin),
      ],
    );
  }
}
