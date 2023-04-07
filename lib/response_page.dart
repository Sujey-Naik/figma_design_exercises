import 'package:application_form/assets/constants.dart';
import 'package:flutter/material.dart';

import 'assets/response_object.dart';

class ResponsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var headlineSmall = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            appBarTitle,
            style: headlineSmall,
          ),
        ),
        body: Padding(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createResponsePage(context),
              const Spacer(),
              _createGoBackButton(context),
            ],
          ),
        ));
  }

  Column _createResponsePage(BuildContext context) {
    var headlineMedium = Theme.of(context).textTheme.headlineMedium;
    var bodyMedium = Theme.of(context).textTheme.bodyMedium;
    var bodyLarge = Theme.of(context).textTheme.bodyLarge;
    Response response = ModalRoute.of(context)?.settings.arguments as Response;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Response",
          style: headlineMedium,
        ),
        sizedBoxResponsePage,
        Text(
          "What is your name?",
          style: bodyMedium,
        ),
        sizedBoxHeightFour,
        Text(
          response.name,
          style: bodyLarge,
        ),
        sizedBoxResponsePage,
        Text(
          "When were you born?",
          style: bodyMedium,
        ),
        sizedBoxHeightFour,
        Text(
          response.dob,
          style: bodyLarge,
        ),
        sizedBoxResponsePage,
        Text(
          "What gender do you identify as?",
          style: bodyMedium,
        ),
        sizedBoxHeightFour,
        Text(
          response.gender!,
          style: bodyLarge,
        ),
        sizedBoxResponsePage,
        Text(
          "What is your country of origin?",
          style: bodyMedium,
        ),
        sizedBoxHeightFour,
        Text(
          response.country!,
          style: bodyLarge,
        ),
        sizedBoxResponsePage,
        Text(
          "What is your opinion on the climate crisis?",
          style: bodyMedium,
        ),
        sizedBoxHeightFour,
        Text(
          response.opinion,
          style: bodyLarge,
        ),
      ],
    );
  }

  ElevatedButton _createGoBackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text(
        "Go Back",
      ),
    );
  }
}
