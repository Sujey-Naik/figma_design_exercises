import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../enums/enums.dart';

extension GenderExtension on Gender {
  String? get value {
    switch (this) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
      case Gender.other:
        return "Other";
      default:
        throw Exception("Unknown gender value");
    }
  }
}

extension DobControllerExtension on TextEditingController {
  void formatDate(DateTime date) {
    text = DateFormat("dd/MM/yyyy").format(date);
  }
}
