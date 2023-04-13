import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../global_variables/global_variable.dart';

class TextFormFieldForName extends StatelessWidget {
  const TextFormFieldForName({super.key});

  @override
  Widget build(BuildContext context) {
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
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
          decoration: const InputDecoration(
            hintText: "Name*",
          ),
          keyboardType: TextInputType.name,
          style: bodySmall,
          validator: (value) {
            if (value != null && (value.isEmpty || value.length < IntConstants.nameMinLength)) {
              return "\u{24D8} Name should have at-least ${IntConstants.nameMinLength} characters";
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
