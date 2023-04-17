import 'package:application_form/resources/colors/app_color.dart';
import 'package:application_form/resources/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../enums/enums.dart';
import '../global_variables/global_variable.dart';

class RadioListTileForGender extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RadioListTileForGenderState();
}

class _RadioListTileForGenderState extends State<RadioListTileForGender> {
  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What gender do you identify as?",
          style: bodyLarge,
        ),
        SizedBoxConstants.sizedBoxHeightEight,
        _createRadioListTile(Gender.male),
        _createRadioListTile(Gender.female),
        _createRadioListTile(Gender.other),
      ],
    );
  }

  RadioListTile _createRadioListTile(Gender gender) {
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    return RadioListTile(
      activeColor: AppColors.selectedWidget.color,
      title: Text(
        gender.value ?? "",
        style: bodySmall,
      ),
      value: gender,
      groupValue: selectedGender,
      onChanged: (value) {
        setState(() {
          selectedGender = value;
        });
      },
    );
  }
}
