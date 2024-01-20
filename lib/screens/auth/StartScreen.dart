import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../utils/CustomProgressLoading.dart';
import '../../utils/MyImages.dart';
import '../../utils/MyLanguages.dart';
import 'CheckLogin.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool intro = false;
  bool login = false;

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    MyImages.app_logo,
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    MyLanguageKeys.sloganTitle.toString().tr,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 100,
                child: CustomProgressLoading().showIndicator(context,
                    color: Theme.of(context).primaryColor)),
          ],
        ),
      ),
    );
  }
}
