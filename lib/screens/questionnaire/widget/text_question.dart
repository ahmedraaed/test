import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TextQuestionnaireComponent extends StatefulWidget {
  const TextQuestionnaireComponent({Key? key}) : super(key: key);

  @override
  State<TextQuestionnaireComponent> createState() => _TextQuestionnaireComponentState();
}

class _TextQuestionnaireComponentState extends State<TextQuestionnaireComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: false,
      onChanged: (notes) {

      },
      autocorrect: false,
      style: Theme.of(context)
          .textTheme
          .subtitle1!,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "text Answer",
      ),
    ).marginSymmetric();
  }
}
