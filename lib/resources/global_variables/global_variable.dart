import 'package:flutter/material.dart';

import '../enums/enums.dart';

final nameController = TextEditingController();
final dobController = TextEditingController();
final opinionController = TextEditingController();
bool isTermsAccepted = false;
Gender? selectedGender;
Country? selectedCountry;
bool isNameValid = true;
bool isDobValid = true;
