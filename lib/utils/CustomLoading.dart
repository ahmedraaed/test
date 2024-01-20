import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/sizes.dart';
import 'MyImages.dart';
import 'MyLanguages.dart';

Widget customLoadingBuilder(Widget image, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) return image;
  return Center(
      child: CircularProgressIndicator().marginAll(MySizes.defaultMargin));
}

Widget errorImageBuilder(
        {String errorImage = MyImages.app_logo,
        double height = double.infinity,
        double width = double.infinity}) =>
    Center(
      child: Image.asset(
        errorImage,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );

Widget emptyListWidget(BuildContext context) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          MyImages.app_logo,
          height: 200,
          width: 200,
        ),
        Text(
        MyLanguageKeys.noResultsFound.toString().tr,
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    ),
  );
}

showLoadingDialog(BuildContext context, {required String title}) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator().marginAll(5),
        Text(title).marginAll(5),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
