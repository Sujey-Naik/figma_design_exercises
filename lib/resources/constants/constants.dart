import 'package:flutter/material.dart';

class PaddingConstants {
  PaddingConstants._();
  static EdgeInsetsGeometry screenPadding = const EdgeInsets.only(
    top: 16.0,
    left: 32.0,
    right: 32.0,
    bottom: 32.0,
  );
  static EdgeInsetsGeometry datePickerButtonRightPadding =
      const EdgeInsets.only(right: 32.0);
}

class IntConstants {
  IntConstants._();
  static int startDate = 1975;
  static int endDate = 2029;
  static int nameMinLength = 3;
  static int opinionFieldMaxLines = 3;
}

class DoubleConstants {
  DoubleConstants._();
  static double alertDialogBorderRadius = 8.0;
  static double dividerThickness = 2.0;
  static double datePickerIconSize = 18.0;
  static double datePickerDateSize = 18.0;
}

class SizedBoxConstants {
  SizedBoxConstants._();
  static SizedBox sizedBoxFormPage = const SizedBox(
    height: 32.0,
  );
  static SizedBox sizedBoxHeightEight = const SizedBox(
    height: 8.0,
  );
  static SizedBox sizedBoxHeightFour = const SizedBox(
    height: 4.0,
  );
  static SizedBox sizedBoxResponsePage = const SizedBox(
    height: 16.0,
  );
}
