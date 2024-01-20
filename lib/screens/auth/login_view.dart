import 'package:dinnova/utils/DinnovaMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinnova/elements/DinnovaPasswordTextField.dart';
import 'package:dinnova/elements/DinnovaPhoneTextField.dart';


import '../../shared/images.dart';
import '../../shared/languages.dart';
import '../../shared/sizes.dart';
import '../main_home/main_home_view.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView();

  @override
  ConsumerState createState() => _loginViewState();
}

class _loginViewState extends ConsumerState<LoginView> {
  bool isTermsChecked = false;
  final _formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPasswordVisable=true;


  @override
  initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: Navigator.canPop(context) ? null : 0,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.all(10.r),
            child: Column(
              children: [
                SizedBox(height: 30.h,),
                Container(
                  padding: EdgeInsets.all(MySizes.defaultMargin),
                  margin: EdgeInsets.only(bottom: MySizes.defaultMargin),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(borderRadius: BorderRadiusDirectional.circular(7.r),child: Image.asset("assets/images/first_logo.png",height: 50.h,width: 50.w,fit: BoxFit.cover,)),

                          InkWell(
                            onTap: () {
                              // ref
                              //     .read(dashboardTabProvider.notifier)
                              //     .ref
                              //     .keepAlive()
                              //     .close();
                              DinnovaMode.changeLanguageMode();
                              // ref
                              //     .read(languageProvider.notifier)
                              //     .update(locale: DinnovaMode.getLanguageMode());
                              // Get.offAllNamed(
                              //     splashRouting.config().screenFullPath);
                            },
                            child: Text(
                              "${DinnovaMode.getLanguageMode().tr == "ar" ? "English" : "العربية"}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                      logo(),
                      login(),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                     margin: EdgeInsetsDirectional.only(
                         end: MySizes.defaultMargin,
                         start: MySizes.defaultMargin),
                     child: TextButton(
                         child: Center(
                           child: Text(
                             LangEnum.login.tr(),
                           ),
                         ),
                         onPressed: () async {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomeView(),));

                         })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: MySizes.defaultMargin * 2),
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(10.r),
            child: Image(
              image: AssetImage("assets/images/second.jpeg"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(MySizes.defaultMargin * 2),
          child: Text("DES",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
      ],
    );
  }

  Widget login() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(
            bottom: MySizes.defaultMargin, top: MySizes.defaultMargin),
        child: Text(LangEnum.login.tr(),
            style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w900,
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.7),
                fontSize: 30)),
      ),
      Form(
        key: _formKey,
        child: Column(children: [
          ///Mobile
          DinnovaPhoneTextField(controller: phoneController,),
          // TextFormField(
          //   controller: phoneController,
          //   decoration: InputDecoration(
          //       labelText: LangEnum.phone.tr(),
          //       prefixIcon: Icon(Icons.phone)
          //   ),
          //   textInputAction: TextInputAction.next,
          //   keyboardType: TextInputType.phone,
          //   inputFormatters: [ FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],
          //   validator: (value) {
          //     if (value != null && value.isEmpty)
          //       return "enter your phone";
          //     return null;
          //   },
          //   onChanged: (val) {},
          // ),
          SizedBox(height: MySizes.defaultMargin),
          DinnovaPasswordTextField(controller: passwordController,
            isPasswordVisible: isPasswordVisable, onChangeVisibleClick: () { setState(() {
              isPasswordVisable=!isPasswordVisable;
            }); },),

        ]),
      ),
    ]);
  }


}
