import 'package:Des/utils/MySizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyLanguages.dart';

class CustomAlertDialog {
  static show(
    BuildContext context, {
    String title = "",
    String body = "",
    String buttonText = "",
    bool enableToCancel = false,
    void Function()? buttonPress,
  }) async {
    if (buttonPress == null) {
      buttonPress = () {
        Navigator.of(context).pop();
      };
    }
    if (buttonText.isEmpty) buttonText = MyLanguageKeys.ok.toString().tr;
    showDialog(
      context: context,
      barrierDismissible: enableToCancel,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 400,
            padding: EdgeInsets.all(MySizes.defaultMargin),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MySizes.radius),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                (title.isEmpty) ? SizedBox() : Text(title),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MySizes.defaultMargin),
                    child: Text(body,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                            fontSize: 20)),
                  ),
                ),
                SizedBox(
                  height: MySizes.buttonHeight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: Size(200, 0),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(MySizes.radius))),
                    child: Text(buttonText,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15)),
                    onPressed: buttonPress,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  showErrorAlert({required String errorMsg, required BuildContext context}) {
    CustomAlertDialog.show(context, body: errorMsg);
  }
}
