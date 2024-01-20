
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/MySizes.dart';
import 'languages.dart';
abstract class ITheme {
  ThemeData getTheme(Brightness brightness);

  late BorderRadius defaultRadius;

  InputDecoration searchInputDecoration(BuildContext context);

  ITheme({BorderRadius? radius}) {
    defaultRadius = radius ?? MySizes.defaultBorderRadius;
  }
}
class DesTheme extends ITheme {
  static ColorScheme _colorSchemeLight = ColorScheme(
    primary: Color(0xff309eac),
    primaryContainer: Color(0xffE1F6F9),
    onPrimaryContainer: Color(0xff2b2b2b),
    secondary: Color(0xffE1F6F9),
    tertiary: Color(0xffF47A84),
    onTertiary: Color(0xffffffff),
    background: Color(0xfff6f6f6),
    secondaryContainer: Color(0xffe1e1e1),
    surface: Color(0xffffffff),
    error: Colors.red,
    onSecondary: Color(0xffffffff),
    onSurface: Color(0xff777777),
    onPrimary: Color(0xffffffff),
    onBackground: Color(0xff777777),
    onError: Color(0xffffffff),
    brightness: Brightness.light,
  );
  static const _colorSchemeDark = ColorScheme(
    primary: Color(0xff309eac),
    primaryContainer: Color(0xff2a2929),
    secondaryContainer: Color(0xff2e2e2e),
    onPrimaryContainer: Color(0xffffffff),
    secondary: Color(0xffE1F6F9),
    tertiary: Color(0xffF47A84),
    onTertiary: Color(0xffffffff),
    onSecondary: Color(0xffffffff),
    onPrimary: Color(0xffffffff),
    surface: Color(0xff414141),
    onBackground: Color(0xffffffff),
    background: Color(0xff2e2e2e),
    error: Colors.red,
    onSurface: Color(0xffffffff),
    onError: Color(0xffffffff),
    brightness: Brightness.dark,
  );
  static var fontFamily = 'cairo';

  @override
  InputDecoration searchInputDecoration(BuildContext context) =>
      TextField().decoration!.copyWith(
          hintStyle: Theme.of(context).textTheme.subtitle2,
          hintText: LangEnum.search.tr(),
          fillColor:
              Theme.of(context).colorScheme.onBackground.withOpacity(.05),
          contentPadding:
              EdgeInsets.symmetric(horizontal: MySizes.defaultMargin / 2),
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          border: OutlineInputBorder(
            borderRadius: MySizes.defaultBorderRadius,
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: MySizes.defaultBorderRadius,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: MySizes.defaultBorderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: MySizes.defaultBorderRadius,
          ));

  static ColorScheme _getCurrentColorScheme({required Brightness brightness}) {
    return (brightness) == Brightness.dark
        ? _colorSchemeDark
        : _colorSchemeLight;
  }

  @override
  ThemeData getTheme(Brightness brightness) {
    var colorScheme = _getCurrentColorScheme(brightness: brightness);
    var textTheme = _getTextTheme(brightness: brightness);
    return ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: colorScheme.background,
        iconTheme: IconThemeData(
          color: colorScheme.onBackground,
        ),
        backgroundColor: colorScheme.background,
        colorScheme: colorScheme,
        primaryColor: colorScheme.primary,
        dialogTheme: DialogTheme(),
        appBarTheme: AppBarTheme(
          // backgroundColor:colorScheme.primary,
          scrolledUnderElevation: 0,
          titleSpacing: 5,
          titleTextStyle: textTheme.headline6!.copyWith(
            color: colorScheme.onPrimary,
          ),
          //
          shadowColor: Colors.transparent,
          color: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
          ),
          centerTitle: false,
        ),
        textTheme: textTheme,
        fontFamily: fontFamily,
        textButtonTheme: ElBaltoButtonThemes.textButtonPrimaryRectTheme(
            brightness: brightness),
        inputDecorationTheme: _inputDecorationTheme(brightness: brightness),
        cardColor: colorScheme.surface,
        cardTheme: CardTheme(
          color: colorScheme.surface,
          surfaceTintColor: colorScheme.surface,
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MySizes.rectRadius),
              side: BorderSide(color: Colors.transparent)),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all<Color>(colorScheme.onPrimary),
          fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          side: BorderSide(color: colorScheme.primary),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
        ),
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.transparent));
  }

  static TextTheme _getTextTheme({required Brightness brightness}) {
    var colorScheme = _getCurrentColorScheme(brightness: brightness);
    return TextTheme(
      headline6:
          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.2),
      headline5:
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.2),
      headline4:
          TextStyle(fontSize: 23, fontWeight: FontWeight.bold, height: 1.2),
      headline3:
          TextStyle(fontSize: 25, fontWeight: FontWeight.bold, height: 1.2),
      headline2:
          TextStyle(fontSize: 27, fontWeight: FontWeight.bold, height: 1.2),
      headline1:
          TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1.2),
      subtitle1: TextStyle(
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.normal,
      ),
      caption: TextStyle(
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.normal,
      ),
      overline: TextStyle(
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.normal,
      ),
      subtitle2:
          TextStyle(fontSize: 15, fontWeight: FontWeight.normal, height: 1.2),
      button: TextStyle(
        fontSize: 15,
        height: 1.2,
        fontWeight: FontWeight.bold,
      ),
    ).apply(
      fontFamily: fontFamily,
      decorationColor: colorScheme.onSurface,
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }
}

class ElBaltoButtonThemes {
  static final double _maxButtonHeight = 30.0;
  static final double _maxButtonWidth = 300.0;

  static TextButtonThemeData textButtonPrimaryCircularTheme(
          {required Brightness brightness}) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor:
                DesTheme._getCurrentColorScheme(brightness: brightness)
                    .primary,
            foregroundColor:
                DesTheme._getCurrentColorScheme(brightness: brightness)
                    .onPrimary,
            //textButtonColor
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            minimumSize: Size(0, _maxButtonHeight),
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: MySizes.defaultBorderRadius)),
      );

  static TextButtonThemeData iconButtonCircleTheme(
          {required Brightness brightness}) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor:
              DesTheme._getCurrentColorScheme(brightness: brightness)
                  .primary,
          foregroundColor:
              DesTheme._getCurrentColorScheme(brightness: brightness)
                  .onSecondary,
          //textButtonColor
          shape: CircleBorder(),
          elevation: 2,
        ),
      );

  static TextButtonThemeData textButtonPrimaryRectTheme(
          {required Brightness brightness}) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor:
                DesTheme._getCurrentColorScheme(brightness: brightness)
                    .primary,
            foregroundColor:
                DesTheme._getCurrentColorScheme(brightness: brightness)
                    .onPrimary,
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            minimumSize: Size(0, _maxButtonHeight),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: MySizes.defaultBorderRadius,
            ),
            disabledBackgroundColor:
                DesTheme._getCurrentColorScheme(brightness: brightness)
                    .onBackground
                    .withOpacity(.2)),
      );

  static TextButtonThemeData transparentTextButton(
          {required Brightness brightness}) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor:
                DesTheme._getCurrentColorScheme(brightness: brightness)
                    .onBackground,
            //textButtonColor
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            minimumSize: Size(0, _maxButtonHeight),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: MySizes.defaultBorderRadius,
            )),
      );
}

InputDecorationTheme _inputDecorationTheme({required Brightness brightness}) =>
    InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      floatingLabelStyle:
          DesTheme._getTextTheme(brightness: brightness).subtitle2,
      labelStyle: DesTheme._getTextTheme(brightness: brightness)
          .subtitle2
          ?.copyWith(height: 2.4),
      hintStyle: DesTheme._getTextTheme(brightness: brightness)
          .subtitle2
          ?.copyWith(height: 2.4),
      filled: true,
      fillColor:
          DesTheme._getCurrentColorScheme(brightness: brightness).surface,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: DesTheme._getCurrentColorScheme(brightness: brightness)
                .primary),
        borderRadius: MySizes.defaultBorderRadius,
        gapPadding: 0,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: DesTheme._getCurrentColorScheme(brightness: brightness)
                .onBackground
                .withOpacity(.4)),
        borderRadius: MySizes.defaultBorderRadius,
        gapPadding: 0,
      ),
      isDense: false,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: DesTheme._getCurrentColorScheme(brightness: brightness)
                .error),
        borderRadius: MySizes.defaultBorderRadius,
        gapPadding: 0,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: DesTheme._getCurrentColorScheme(brightness: brightness)
                .onBackground
                .withOpacity(.4)),
        borderRadius: MySizes.defaultBorderRadius,
        gapPadding: 0,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: DesTheme._getCurrentColorScheme(brightness: brightness)
                .error),
        borderRadius: MySizes.defaultBorderRadius,
        gapPadding: 0,
      ),
    );
