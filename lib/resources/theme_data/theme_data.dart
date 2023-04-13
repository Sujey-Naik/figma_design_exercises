import 'package:application_form/resources/colors/app_color.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ThemeDataClass {
  ThemeDataClass._();
  static ThemeData getThemeData() {
    return ThemeData(
      shadowColor: AppColors.shadow.color,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor.color,
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(DoubleConstants.alertDialogBorderRadius),
        ),
      ),
      scaffoldBackgroundColor: AppColors.scaffold.backgroundColor,
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      listTileTheme: const ListTileThemeData(
        minLeadingWidth: 0.0,
        horizontalTitleGap: 10.0,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
        dense: true,
      ),
      unselectedWidgetColor: AppColors.unselectedWidget.color,
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          letterSpacing: 0.2,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
          color: AppColors.text.headLineSmallColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
          color: AppColors.text.headLineMediumColor,
          letterSpacing: 0.2,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          letterSpacing: 0.22,
          color: AppColors.text.bodySmallColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: AppColors.text.bodyMediumColor,
          letterSpacing: 0.22,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          color: AppColors.text.bodyLargeColor,
          letterSpacing: 0.2,
        ),
        displaySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
          color: AppColors.text.displaySmallColor,
          letterSpacing: 0.35,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              color: AppColors.elevatedButton.textColor,
              letterSpacing: 0.32,
            ),
          ),
          visualDensity: const VisualDensity(),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(40.0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          backgroundColor: MaterialStateProperty.all(
            AppColors.elevatedButton.enabledColor,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: AppColors.appBar.backgroundColor,
        toolbarHeight: 56.0,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(4.0),
          shadowColor: MaterialStateProperty.all(AppColors.outlinedButton.shadowColor),
          backgroundColor: MaterialStateProperty.all(AppColors.outlinedButton.backgroundColor),
          visualDensity: const VisualDensity(),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: AppColors.outlinedButton.borderColor),
            ),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: DoubleConstants.dividerThickness,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(
          height: 0.4,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          letterSpacing: 0.3,
          color: AppColors.inputDecorationTheme.errorTextColor,
        ),
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          letterSpacing: 0.22,
          color: AppColors.inputDecorationTheme.hintTextColor,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: AppColors.inputDecorationTheme.errorBorderColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: AppColors.inputDecorationTheme.focusedErrorBorderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: AppColors.inputDecorationTheme.borderColor,
          ),
        ),
      ),
    );
  }
}
