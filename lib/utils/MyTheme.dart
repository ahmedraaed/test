import 'package:Des/utils/MySizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  final theme = ThemeData(
      primarySwatch: Colors.lightBlue,
      backgroundColor: _MyColors.backgroundColor,
      primaryColor: _MyColors.primaryColor,
      scaffoldBackgroundColor: _MyColors.backgroundColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: _MyColors.primaryColor,
        selectionColor: _MyColors.primaryColor,
        selectionHandleColor: _MyColors.primaryColor,
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      brightness: Brightness.light,
      dataTableTheme: DataTableThemeData(
        columnSpacing: 15,
        decoration: BoxDecoration(
          border: Border.all(
            color: _MyColors.primaryColor,
            width: 3,
          ),
        ),
        headingRowColor:
            MaterialStateProperty.all<Color>(_MyColors.primaryColor),
        dataRowColor:
            MaterialStateProperty.all<Color>(_MyColors.backgroundColor),
      ),
      errorColor: _MyColors.errorColor,
      bottomAppBarColor: _MyColors.accentColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: _MyColors.backgroundColor, //change your color here
        ),
        backgroundColor: _MyColors.primaryColor,
        titleTextStyle:
            _CustomTheme.textTheme.headline6!.copyWith(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _MyColors.primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: _CustomTheme.textTheme,
      fontFamily: _CustomTheme.fontFamily,
      textButtonTheme: _CustomTheme.textThemeButtonData,
      inputDecorationTheme: _CustomTheme.inputDecorationTheme,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySizes.radius),
        ),
        color: Color(0xFFF5F4F4),
        elevation: 1,
        margin: EdgeInsets.all(MySizes.defaultMargin),
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          color: _MyColors.backgroundColor,
          border: Border.all(
            color: _MyColors.primaryColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(MySizes.radius),
        ),
        unselectedLabelColor: Colors.white,
        labelPadding: EdgeInsets.zero,
        labelStyle: _CustomTheme.textTheme.subtitle1,
        unselectedLabelStyle: _CustomTheme.textTheme.subtitle1,
        labelColor: _MyColors.primaryColor,
      ),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.transparent));
}

class _MyColors {
  static final Color primaryColor = Color(0xFF003463);
  static final Color accentColor = Colors.black;
  static final Color backgroundColor = Colors.white;
  static final Color errorColor = Colors.red;
}

class _CustomTheme {
  static final borderRadius = BorderRadius.circular(MySizes.radius);
  static final fontFamily = 'cairo';

  static final TextTheme textTheme = TextTheme(
          headline4: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      .apply(
    fontFamily: fontFamily,
    displayColor: Colors.black,
  );

  static final TextButtonThemeData textThemeButtonData = TextButtonThemeData(
    style: TextButton.styleFrom(
        primary: Colors.white,
        //Text Color
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        backgroundColor: _MyColors.primaryColor,
        minimumSize: Size(MySizes.buttonHeight, 50),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        )),
  );

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: _MyColors.accentColor.withOpacity(.2),
      ),
      borderRadius: borderRadius,
    ),
    contentPadding: EdgeInsets.all(10),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: _MyColors.accentColor,
      ),
      borderRadius: borderRadius,
    ),
    labelStyle: TextStyle(
      color: _MyColors.accentColor.withOpacity(.5),
      fontWeight: FontWeight.bold,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: _MyColors.errorColor,
      ),
      borderRadius: borderRadius,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: _MyColors.errorColor,
      ),
      borderRadius: borderRadius,
    ),
  );
}
