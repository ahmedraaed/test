import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/MyLanguages.dart';

class NumberQuestionnaireComponent extends StatefulWidget {
  const NumberQuestionnaireComponent({Key? key}) : super(key: key);

  @override
  State<NumberQuestionnaireComponent> createState() => _TextQuestionnaireComponentState();
}

class _TextQuestionnaireComponentState extends State<NumberQuestionnaireComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (notes) {
      },
      style: Theme.of(context)
          .textTheme
          .subtitle1!,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "number answer",
      ),
    ).marginSymmetric();
  }
}
