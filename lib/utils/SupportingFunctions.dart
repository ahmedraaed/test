import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyLanguages.dart';

Future<bool> checkInternet() async {
  bool isConnected = false;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      isConnected = true;
    }
  } on SocketException catch (_) {
    print('not connected');
  }
  return isConnected;
}

List<int> returnTheNumbersBetween(
    {required int startNumber, required int endNumber}) {
  List<int> result = [];
  for (int i = startNumber; i <= endNumber; i++) result.add(i);
  return result;
}

Widget numberPicker(
    {required int startNumber,
    required BuildContext context,
    required int endNumber,
    required onSelected(int selcetion),
    int? preSelceted}) {
  List<int> options =
      returnTheNumbersBetween(startNumber: startNumber, endNumber: endNumber);
  int? selectedNumber = preSelceted;
  return DropdownButtonFormField<int>(
    hint: Text(MyLanguageKeys.choose.toString().tr,
        style: Theme.of(context).textTheme.subtitle1),
    value: selectedNumber,
    onChanged: (int? value) {
      onSelected(value!);
      selectedNumber = value;
    },
    icon: Icon(
      Icons.keyboard_arrow_down_rounded,
      color: Colors.black,
    ),
    items: options.map((int model) {
      return DropdownMenuItem<int>(
        value: model,
        child: Text(model.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1),
      );
    }).toList(),
  );
}
