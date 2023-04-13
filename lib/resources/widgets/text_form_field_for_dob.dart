import 'package:application_form/resources/colors/app_color.dart';
import 'package:application_form/resources/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../global_variables/global_variable.dart';

class TextFormFieldForDob extends StatelessWidget {
  const TextFormFieldForDob({super.key});

  @override
  Widget build(BuildContext context) {
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
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
                      bodySmall: TextStyle(fontSize: DoubleConstants.datePickerDateSize)
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(PaddingConstants.datePickerButtonRightPadding),
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
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "\u{24D8} Please enter your date of birth";
            }
            return null;
          },
        ),
      ],
    );
  }
}
