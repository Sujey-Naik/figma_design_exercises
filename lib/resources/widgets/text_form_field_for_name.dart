import 'package:flutter/material.dart';

import '../colors/app_color.dart';
import '../constants/constants.dart';
import '../global_variables/global_variable.dart';

class TextFormFieldForName extends StatefulWidget {
  @override
  State<TextFormFieldForName> createState() => _TextFormFieldForNameState();
}

class _TextFormFieldForNameState extends State<TextFormFieldForName> {
  @override
  void initState(){
    super.initState();
    nameController.addListener(() => _nameValidation(nameController.text));
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
          "What is your name?",
          style: bodyLarge,
        ),
        SizedBoxConstants.sizedBoxHeightEight,
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: nameController,
          decoration: InputDecoration(
            hintText: "Name*",
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: isNameValid
                    ? AppColors.inputDecorationTheme.borderColor
                    : AppColors.inputDecorationTheme.errorBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: isNameValid
                    ? AppColors.primaryColor.color
                    : AppColors.inputDecorationTheme.errorBorderColor,
              ),
            ),
          ),
          keyboardType: TextInputType.name,
          style: bodySmall,
        ),
        isNameValid
            ? SizedBoxConstants.emptySizedBox
            : SizedBoxConstants.sizedBoxHeightFour,
        isNameValid
            ? Row()
            : Row(
                children: [
                  SizedBoxConstants.sizedBoxBeforeErrorIcon,
                  const Icon(Icons.error_outline_rounded),
                  SizedBoxConstants.sizedBoxBetweenErrorIconMessage,
                  Padding(
                    padding: PaddingConstants.errorTextTopPadding,
                    child: Text(
                      "Name should have at-least 3 characters",
                      style: displayMedium,
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  void _nameValidation(String value) {
    if (value.isEmpty || value.length < IntConstants.nameMinLength) {
      isNameValid = false;
      setState(() {});
    } else {
      isNameValid = true;
      setState(() {});
    }
  }
}
