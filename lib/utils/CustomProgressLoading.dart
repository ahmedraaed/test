import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MyLanguages.dart';
import 'MySizes.dart';

class CustomProgressLoading {
  Widget showFullDialog(BuildContext context) {
    return Center(
      child: Container(
        child: Center(
          child: Container(
            height: 50,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(MySizes.defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: MySizes.defaultMargin),
                      child: Text(
                        MyLanguageKeys.loadingPleaseWait.toString().tr,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showIndicator(context, {Color? color}) {
    if (color == null) color = Theme.of(context).primaryColor;
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  showAlertLoaderDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: showIndicator(context),
        );
      },
    );
  }
}
