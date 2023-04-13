import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../global_variables/global_variable.dart';

class TextFormFieldForOpinion extends StatelessWidget{
  const TextFormFieldForOpinion({super.key});

  @override
  Widget build(BuildContext context) {
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your opinion on the climate crisis?",
          style: bodyLarge,
        ),
        SizedBoxConstants.sizedBoxHeightEight,
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: opinionController,
          decoration: const InputDecoration(hintText: "Enter your message"),
          maxLines: IntConstants.opinionFieldMaxLines,
          style: bodySmall,
        ),
      ],
    );
  }

}
