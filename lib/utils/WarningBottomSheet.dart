import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyLanguages.dart';
import 'MySizes.dart';
class WarningBottomSheet {
  void init(context,String title,String content) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(MySizes.defaultMargin)),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(MySizes.defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          title,
                          style: Theme.of(context).textTheme.headline6),
                      Text(content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.grey)),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                                MyLanguageKeys.ok.toString().tr,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(color: Colors.white)),
                          )).marginSymmetric(horizontal: MySizes.defaultMargin),
                    ],
                  ),
                ),
              ).marginAll(MySizes.defaultMargin),
            ],
          );
        });
  }
}
