import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../enums/enums.dart';
import '../global_variables/global_variable.dart';
import '../helpers/helper_methods.dart';

class DropDownFormFieldForCountry extends StatefulWidget{
  @override
  State<DropDownFormFieldForCountry> createState() => DropDownFormFieldForCountryState();
}

class DropDownFormFieldForCountryState extends State<DropDownFormFieldForCountry> {
  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme
        .of(context)
        .textTheme
        .bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your country of origin?",
          style: bodyLarge,
        ),
        SizedBoxConstants.sizedBoxHeightEight,
        _createDropDownMenu(),
      ],
    );
  }

  DropdownButtonFormField<String> _createDropDownMenu() {
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    return DropdownButtonFormField<String>(
      icon: const Icon(Icons.keyboard_arrow_down),
      hint: const Text('Select Country'),
      value: CountryHelper.getCountryName(selectedCountry),
      onChanged: (String? value) {
        selectedCountry = CountryHelper.getCountry(value);
        setState(() {
        });
      },
      items: Country.values.map((Country country) {
        return DropdownMenuItem<String>(
          value: CountryHelper.getCountryName(country),
          child: Text(
            CountryHelper.getCountryName(country)?? "",
            style: bodySmall,
          ),
        );
      }).toList(),
    );
  }
}
