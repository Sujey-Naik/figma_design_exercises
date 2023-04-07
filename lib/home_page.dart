import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'assets/constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _opinionController = TextEditingController();
  bool _acceptTerms = false;
  Gender? _selectedGender;
  Country? _selectedCountry;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      showDialog(
        context: context,
        builder: (BuildContext context) => _createAlertDialog(),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _opinionController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var headlineSmall = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: headlineSmall,
        ),
      ),
      body: Padding(
        padding: screenPadding,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _createTextFormFieldForName(),
                sizedBoxFormPage,
                _createTextFormFieldForDob(),
                sizedBoxFormPage,
                _createRadioListTileForGender(),
                sizedBoxFormPage,
                _createTextFormFieldForOpinion(),
                sizedBoxFormPage,
                _createDropDownFormFieldForCountry(),
                sizedBoxFormPage,
                _createCheckBoxForTermsAndConditions(),
                sizedBoxFormPage,
                _createSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RadioListTile _createRadioListTile(Gender gender) {
    var bodySmall = Theme.of(context).textTheme.bodySmall;
    return RadioListTile(
      activeColor: selectedWidgetColor,
      title: Text(
        gender._name!,
        style: bodySmall,
      ),
      value: gender,
      groupValue: _selectedGender,
      onChanged: (value) {
        setState(() {
          _selectedGender = value;
        });
      },
    );
  }

  DropdownButtonFormField<String> _createDropDownMenu() {
    var bodySmall = Theme.of(context).textTheme.bodySmall;
    return DropdownButtonFormField<String>(
      icon: const Icon(Icons.keyboard_arrow_down),
      hint: const Text('Select a country'),
      value: _selectedCountry?._name,
      onChanged: (String? value) {
        _selectedCountry = _getCountry(value);
        setState(() {});
      },
      items: Country.values.map((Country country) {
        return DropdownMenuItem<String>(
          value: country._name,
          child: Text(
            country._name ?? '',
            style: bodySmall,
          ),
        );
      }).toList(),
    );
  }

  AlertDialog _createAlertDialog() {
    var bodySmall = Theme.of(context).textTheme.bodySmall;
    var displaySmall = Theme.of(context).textTheme.displaySmall;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(alertDialogBorderRadius),
      ),
      content: Text(
        "Successfully submitted the form!",
        style: bodySmall,
      ),
      actions: [
        const Divider(),
        ButtonBar(
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
                    name: _nameController.text,
                    dob: _dobController.text,
                    gender: _selectedGender?._name,
                    opinion: _opinionController.text,
                    country: _selectedCountry?._name,
                  ),
                )
                    .then((_) {
                  _resetPage();
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Column _createTextFormFieldForName() {
    var bodySmall = Theme.of(context).textTheme.bodySmall;
    var bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your name?",
          style: bodyLarge,
        ),
        sizedBoxHeightEight,
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: _nameController,
          decoration: const InputDecoration(
            hintText: "Name*",
          ),
          keyboardType: TextInputType.name,
          style: bodySmall,
          validator: (value) {
            if (value!.isEmpty || value.length < nameMinLength) {
              return "\u{24D8} Name should have at-least $nameMinLength characters";
            }
            return null;
          },
        ),
      ],
    );
  }

  Column _createTextFormFieldForDob() {
    var bodySmall = Theme.of(context).textTheme.bodySmall;
    var bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "When were you born?",
          style: bodyLarge,
        ),
        sizedBoxHeightEight,
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: _dobController,
          decoration: const InputDecoration(
            hintText: "Date of Birth*",
            suffixIcon: Icon(Icons.calendar_today_outlined),
          ),
          keyboardType: TextInputType.none,
          style: bodySmall,
          onTap: () async {
            final DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(startDate),
              lastDate: DateTime(endDate),
            );
            if (date != null) {
              _dobController.text = DateFormat("dd/MM/yyyy").format(date);
            }
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "\u{24D8} Please enter your date of birth";
            }
            return null;
          },
        ),
      ],
    );
  }

  Column _createRadioListTileForGender() {
    var bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What gender do you identify as?",
          style: bodyLarge,
        ),
        sizedBoxHeightEight,
        _createRadioListTile(Gender.MALE),
        _createRadioListTile(Gender.FEMALE),
        _createRadioListTile(Gender.OTHERS),
      ],
    );
  }

  Column _createTextFormFieldForOpinion() {
    var bodySmall = Theme.of(context).textTheme.bodySmall;
    var bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your opinion on the climate crisis?",
          style: bodyLarge,
        ),
        sizedBoxHeightEight,
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: _opinionController,
          decoration: const InputDecoration(hintText: "Enter your message"),
          maxLines: 3,
          style: bodySmall,
          validator: (value) {
            if (value!.isEmpty) {
              return "\u{24D8} Please write your opinion";
            }
            return null;
          },
        ),
      ],
    );
  }

  Column _createDropDownFormFieldForCountry() {
    var bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your country of origin?",
          style: bodyLarge,
        ),
        sizedBoxHeightEight,
        _createDropDownMenu(),
      ],
    );
  }

  CheckboxListTile _createCheckBoxForTermsAndConditions() {
    var bodySmall = Theme.of(context).textTheme.bodySmall;
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: selectedWidgetColor,
        title: Text(
          "I accept to the terms and conditions",
          style: bodySmall,
        ),
        value: _acceptTerms,
        onChanged: (value) {
          setState(() {
            _acceptTerms = value!;
          });
        });
  }

  ElevatedButton _createSubmitButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          _acceptTerms
              ? elevatedButtonEnabledColor
              : elevatedButtonDisabledColor,
        ),
      ),
      onPressed: _acceptTerms ? _submitForm : null,
      child: const Text(
        "Submit",
      ),
    );
  }

  void _resetPage() {
    _nameController.text = "";
    _dobController.text = "";
    _opinionController.text = "";
    _selectedCountry = null;
    _selectedGender = null;
    _acceptTerms = false;
    setState(() {});
  }
}

enum Gender {
  MALE,
  FEMALE,
  OTHERS,
}

extension GenderExtension on Gender {
  String? get _name {
    switch (this) {
      case Gender.MALE:
        return "Male";
      case Gender.FEMALE:
        return "Female";
      case Gender.OTHERS:
        return "Others";
      default:
        return null;
    }
  }
}

enum Country {
  INDIA,
  CHINA,
  ENGLAND,
}

extension CountryExtension on Country {
  String? get _name {
    switch (this) {
      case Country.INDIA:
        return "India";
      case Country.CHINA:
        return "China";
      case Country.ENGLAND:
        return "England";
      default:
        return null;
    }
  }
}

Country? _getCountry(String? name) {
  switch (name) {
    case "India":
      return Country.INDIA;
    case "China":
      return Country.CHINA;
    case "England":
      return Country.ENGLAND;
    default:
      return null;
  }
}
