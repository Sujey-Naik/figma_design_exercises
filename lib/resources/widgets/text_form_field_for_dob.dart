import 'package:application_form/resources/colors/app_color.dart';
import 'package:application_form/resources/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../global_variables/global_variable.dart';

class TextFormFieldForDob extends StatefulWidget {
  @override
  State<TextFormFieldForDob> createState() => _TextFormFieldForDobState();
}

class _TextFormFieldForDobState extends State<TextFormFieldForDob> {
  @override
  void initState(){
    super.initState();
    dobController.addListener(() => _dobValidation(dobController.text));
  }

  @override
  Widget build(BuildContext context) {
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final displayMedium = Theme.of(context).textTheme.displayMedium;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "When were you born?",
          style: bodyLarge,
        ),
        SizedBoxConstants.sizedBoxHeightEight,
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: dobController,
          decoration: InputDecoration(
            hintText: "Date of Birth*",
            suffixIcon: Icon(
              Icons.calendar_today_outlined,
              color: AppColors.datePicker.iconColor,
              size: DoubleConstants.datePickerIconSize,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: isDobValid
                    ? AppColors.inputDecorationTheme.borderColor
                    : AppColors.inputDecorationTheme.errorBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: isDobValid
                    ? AppColors.primaryColor.color
                    : AppColors.inputDecorationTheme.errorBorderColor,
              ),
            ),
          ),
          keyboardType: TextInputType.none,
          style: bodySmall,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: () async {
            final DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(IntConstants.startDate),
              lastDate: DateTime(IntConstants.endDate),
              locale: const Locale('en', 'GB'),
              builder: (context, child) => Theme(
                data: ThemeData().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: AppColors.datePicker.color,
                  ),
                  textTheme: TextTheme(
                      bodySmall: TextStyle(
                          fontSize: DoubleConstants.datePickerDateSize)),
                  textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          PaddingConstants.datePickerButtonRightPadding),
                    ),
                  ),
                ),
                child: child!,
              ),
            );
            if (date != null) {
              dobController.formatDate(date);
            }
          },
        ),
        isDobValid
            ? SizedBoxConstants.emptySizedBox
            : SizedBoxConstants.sizedBoxHeightFour,
        isDobValid
            ? Row()
            : Row(
                children: [
                  SizedBoxConstants.sizedBoxBeforeErrorIcon,
                  const Icon(Icons.error_outline_rounded),
                  SizedBoxConstants.sizedBoxBetweenErrorIconMessage,
                  Padding(
                      padding: PaddingConstants.errorTextTopPadding,
                      child: Text(
                        "Please enter your date of birth",
                        style: displayMedium,
                      ))
                ],
              )
      ],
    );
  }

  void _dobValidation(String value) {
    if (value.isEmpty) {
      isDobValid = false;
      setState(() {});
    } else {
      isDobValid = true;
      setState(() {});
    }
  }
}
