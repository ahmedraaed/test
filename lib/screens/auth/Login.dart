import 'package:dinnova/DinnovaWeb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../shared/sizes.dart';
import '../../utils/MyImages.dart';
import '../../utils/MyLanguages.dart';
import '../home/Dashboard.dart';
import 'LoginProvider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  LoginProvider loginProvider = LoginProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: DinnovaWeb(context).width(
            child: ChangeNotifierProvider.value(
                value: loginProvider,
                builder: (context, widget) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        margin: EdgeInsets.all(MySizes.defaultMargin),
                        child: Image(
                          image: AssetImage(
                            MyImages.app_logo,
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                MyLanguageKeys.login.toString().tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ).marginSymmetric(
                                  vertical: MySizes.defaultMargin),
                              Form(
                                key: _formKey,
                                onChanged: () {
                                  setState(() {});
                                },
                                child: Column(children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: MyLanguageKeys.enterPhoneHint
                                          .toString()
                                          .tr,
                                      suffixIcon: IconButton(
                                        icon: Center(
                                          child: Icon(
                                            Icons.person_outline_rounded,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    controller: mobileNumberController,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    //enabled: false,
                                    keyboardType: TextInputType.phone,
                                    style:
                                        Theme.of(context).textTheme.subtitle1!,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value != null && value.isEmpty)
                                        return MyLanguageKeys.cantEmpty
                                            .toString()
                                            .tr;
                                    },
                                  ).marginSymmetric(
                                      vertical: MySizes.defaultMargin),
                                  TextFormField(
                                    controller: passwordController,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    style:
                                        Theme.of(context).textTheme.subtitle1!,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      labelText: MyLanguageKeys
                                          .enterYourPassword
                                          .toString()
                                          .tr,
                                      suffixIcon: IconButton(
                                        icon: Center(
                                          child: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _obscureText
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                          ),
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _obscureText,
                                    validator: (value) {
                                      if (value != null && value.isEmpty)
                                        return MyLanguageKeys.cantEmpty
                                            .toString()
                                            .tr;
                                      else if (value!.length < 6)
                                        return MyLanguageKeys.passwordHintError
                                            .toString()
                                            .tr;
                                    },
                                  ).marginSymmetric(
                                      vertical: MySizes.defaultMargin),
                                ]),
                              ).marginSymmetric(
                                  horizontal: MySizes.defaultMargin),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  context.watch<LoginProvider>().loading
                                      ? CircularProgressIndicator()
                                      : TextButton(
                                          child: Center(
                                            child: Text(
                                                MyLanguageKeys.login
                                                    .toString()
                                                    .tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button!
                                                    .copyWith(
                                                        color: Colors.white)),
                                          ),
                                          onPressed: () {
                                            Get.offAll(() => Dashboard());
                                          },
                                        ).marginSymmetric(
                                          vertical: MySizes.defaultMargin,
                                          horizontal: MySizes.defaultMargin),
                                ],
                              ).marginSymmetric(
                                  vertical: MySizes.defaultMargin),
                            ],
                          ).marginSymmetric(horizontal: MySizes.defaultMargin),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
