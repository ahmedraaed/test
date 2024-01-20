import 'package:Des/screens/auth/login_view.dart';
import 'package:Des/shared/languages.dart';
import 'package:Des/shared/theme.dart';
import 'package:dinnova/DinnovaEnums.dart';
import 'package:dinnova/api/DinnovaApiController.dart';
import 'package:dinnova/utils/DinnovaMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

_initApiController() async {
  DinnovaApiController.init(
    baseUrl: "https://authoritysurvey.azurewebsites.net",
    serverErrorMessage: "Something Wrong", connectionErrorMessage: '',
  );
  Auth.init(
    apiKey: "08b208a8-e55c-468d-bd00-d54ea5db296c",
    appSecret: "be71b762-7496-4d5a-aa5c-95e3b6d7b764",
    refreshTokenUrl: "/api/v1/Authorization/RefreshToken",
    revokeTokenUrl: "/api/v1/Authorization/RevokeToken",
    secretCer: "okgOZmQDDvDxxLNMHfdQZs7WP5lFuInI",
    userAgent: DinnovaUserAgentEnum.Android,
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await _initApiController();
    return runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  //final FirebaseAnalytics analytics = Get.find();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        theme: DesTheme().getTheme(Brightness.light),
        darkTheme: DesTheme().getTheme(Brightness.dark),
        translations: MyLanguages(),
        locale: Locale(DinnovaMode.getLanguageMode(
            initLang: DinnovaMode.getLanguageMode())),
        fallbackLocale: const Locale(MyLanguages.enKey),
        supportedLocales: const [
          Locale(MyLanguages.enKey),
          Locale(MyLanguages.arKey),

        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // getPages: screenPages,
        themeMode: DinnovaMode.getThemeMode(),
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
      ),
    );
  }
}
