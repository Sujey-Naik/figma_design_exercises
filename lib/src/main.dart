import 'package:application_form/resources/theme_data/theme_data.dart';
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";

import 'home_page.dart';

void main() {
  runApp(const ApplicationForm());
}

class ApplicationForm extends StatelessWidget {
  const ApplicationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeDataClass.getThemeData(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('en', 'GB'),
      ],
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
      },
    );
  }
}
