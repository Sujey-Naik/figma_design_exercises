import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static PrimaryColors primaryColor = PrimaryColors();
  static ShadowColors shadow = ShadowColors();
  static ContainerColors container = ContainerColors();
  static ScaffoldColors scaffold = ScaffoldColors();
  static TextColors text = TextColors();
  static SelectedWidgetColors selectedWidget = SelectedWidgetColors();
  static UnselectedWidgetColors unselectedWidget = UnselectedWidgetColors();
  static ElevatedButtonColors elevatedButton = ElevatedButtonColors();
  static AppBarColors appBar = AppBarColors();
  static OutlinedButtonColors outlinedButton = OutlinedButtonColors();
  static InputDecorationThemeColors inputDecorationTheme =
      InputDecorationThemeColors();
  static DatePickerColors datePicker = DatePickerColors();
}

class DatePickerColors {
  Color iconColor = const Color(0xFFD1D1D6);
  Color color = const Color(0xFF6A39F1);
}

class InputDecorationThemeColors {
  Color errorTextColor = const Color(0xFFFF3B30);
  Color hintTextColor = const Color(0xFF8A8A8E);
  Color errorBorderColor = const Color(0xFFFF3B30);
  Color borderColor = const Color(0xFFD1D1D6);
}

class OutlinedButtonColors {
  Color shadowColor = const Color.fromRGBO(
    24,
    39,
    75,
    0.12,
  );
  Color backgroundColor = const Color(0xFFFFFFFF);
  Color borderColor = const Color(0xFFD1D1D6);
}

class AppBarColors {
  Color backgroundColor = const Color(0xFFFFFFFF);
}

class ElevatedButtonColors {
  Color textColor = const Color(0xFFFFFFFF);
  Color disabledColor = const Color(0xFFEEEEF3);
  Color enabledColor = const Color(0xFF6A39F1);
}

class UnselectedWidgetColors {
  Color color = const Color(0xFF6A39F1);
}

class SelectedWidgetColors {
  Color color = const Color(0xFF6A39F1);
}

class ShadowColors {
  Color color = const Color(0xFF36383A);
}

class PrimaryColors {
  Color color = const Color(0xFF6A39F1);
}

class ContainerColors {
  Color borderColor = const Color(0xFFE5E5EA);
}

class ScaffoldColors {
  Color backgroundColor = const Color(0xFFFFFFFF);
}

class TextColors {
  Color headLineSmallColor = const Color(0xFF6A39F1);
  Color headLineMediumColor = const Color(0xFF36383A);
  Color bodySmallColor = const Color(0xFF36383A);
  Color bodyMediumColor = const Color(0xFF8A8A8E);
  Color bodyLargeColor = const Color(0xFF36383A);
  Color displaySmallColor = const Color(0xFF36383A);
}
