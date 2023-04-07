import 'package:flutter/material.dart';

const EdgeInsetsGeometry screenPadding = EdgeInsets.all(
  32.0,
);
const int startDate = 1975;
const int endDate = 2029;
const int nameMinLength = 3;
const SizedBox sizedBoxFormPage = SizedBox(
  height: 32.0,
);
const SizedBox sizedBoxHeightEight = SizedBox(
  height: 8.0,
);
const SizedBox sizedBoxHeightFour = SizedBox(
  height: 4.0,
);
const SizedBox sizedBoxResponsePage = SizedBox(
  height: 16.0,
);
const double appBarElevation = 0.0;
const double alertDialogBorderRadius = 8.0;
const double dividerThickness = 2.0;
const String appBarTitle = "Form";
const Color elevatedButtonEnabledColor = Colors.indigoAccent;
Color elevatedButtonDisabledColor = Colors.grey.shade300;
const selectedWidgetColor = Colors.indigoAccent;

class Response {
  String name;
  String dob;
  String? gender;
  String opinion;
  String? country;

  Response(
      {required this.name,
      required this.dob,
      required this.gender,
      required this.opinion,
      required this.country});
}
