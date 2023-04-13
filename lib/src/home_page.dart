import 'package:application_form/resources/colors/app_color.dart';
import 'package:application_form/resources/constants/constants.dart';
import 'package:application_form/resources/widgets/text_form_field_for_dob.dart';
import 'package:application_form/resources/widgets/text_form_field_for_opinion.dart';
import 'package:flutter/material.dart';

import '../resources/global_variables/global_variable.dart';
import '../resources/model/response_object.dart';
import '../resources/widgets/drop_down_form_field_for_country.dart';
import '../resources/widgets/radio_list_tile_for_gender.dart';
import '../resources/widgets/text_form_field_for_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    nameController.dispose();
    opinionController.dispose();
    dobController.dispose();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      const snackBar = SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Welcome Back!'),
        backgroundColor: (Colors.deepPurpleAccent),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form",
          style: headlineSmall,
        ),
      ),
      body:  Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: PaddingConstants.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextFormFieldForName(),
                  SizedBoxConstants.sizedBoxFormPage,
                  const TextFormFieldForDob(),
                  SizedBoxConstants.sizedBoxFormPage,
                  RadioListTileForGender(),
                  SizedBoxConstants.sizedBoxFormPage,
                  const TextFormFieldForOpinion(),
                  SizedBoxConstants.sizedBoxFormPage,
                  DropDownFormFieldForCountry(),
                  SizedBoxConstants.sizedBoxFormPage,
                  _createCheckBoxForTermsAndCondition(),
                  SizedBoxConstants.sizedBoxFormPage,
                  _createElevatedButton(),
                ],
              ),
            ),
          ),
        ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState?.validate() == true) {
        _formKey.currentState?.save();
        showDialog(
          context: context,
          builder: (BuildContext context) => _createAlertDialog(),
          barrierDismissible: false,
        );
      }
    }
  }
  
  ElevatedButton _createElevatedButton(){
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isTermsAccepted
              ? AppColors.elevatedButton.enabledColor
              : AppColors.elevatedButton.disabledColor,
        ),
      ),
      onPressed: isTermsAccepted ? _submitForm : null,
      child: const Text(
        "Submit",
      ),
    );
  }

  CheckboxListTile _createCheckBoxForTermsAndCondition(){
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.selectedWidget.color,
      title: Text(
        "I agree to the terms and conditions",
        style: bodySmall,
      ),
      value: isTermsAccepted,
      onChanged: (value) {
        setState(() {
          isTermsAccepted = value?? false;
        });
      },
    );
  }

  AlertDialog _createAlertDialog(){
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final displaySmall = Theme.of(context).textTheme.displaySmall;
    return AlertDialog(
      content: Text(
        "Successfully submitted the form!",
        style: bodySmall,
      ),
      actions: [
        Container(
          decoration:  BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.container.borderColor,
              ),
            ),
          ),
          child: ButtonBar(
            children: [
              OutlinedButton(
                child: Text(
                  "Close",
                  style: displaySmall,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetPage();
                },
              ),
              OutlinedButton(
                child: Text(
                  "View Response",
                  style: displaySmall,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .popAndPushNamed(
                    "/response",
                    arguments: Response(
                      name: nameController.text,
                      dob: dobController.text,
                      gender: selectedGender?.name,
                      opinion: opinionController.text,
                      country: selectedCountry?.name,
                    ),
                  )
                      .then((_) {
                     _resetPage();
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _resetPage() {
    nameController.text = "";
    dobController.text = "";
    opinionController.text = "";
    selectedCountry = null;
    selectedGender = null;
    isTermsAccepted = false;
    setState(() {});
  }
}
