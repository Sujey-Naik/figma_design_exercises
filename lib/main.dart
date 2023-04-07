import "package:application_form/response_page.dart";
import "package:flutter/material.dart";
import "package:application_form/assets/constants.dart";

import "home_page.dart";

void main() {
  runApp(ApplicationForm());
}

class ApplicationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          listTileTheme: const ListTileThemeData(
            minLeadingWidth: 0.0,
            horizontalTitleGap: 10.0,
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
            dense: true,
          ),
          unselectedWidgetColor: Colors.indigoAccent,
          textTheme: const TextTheme(
            headlineSmall: TextStyle(
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: Colors.indigoAccent,
            ),
            headlineMedium: TextStyle(
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: Colors.black,
            ),
            bodySmall: TextStyle(
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.black,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.grey,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              color: Colors.black,
            ),
            displaySmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
              visualDensity: const VisualDensity(),
              minimumSize:
                  MaterialStateProperty.all(const Size.fromHeight(40.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
              backgroundColor: MaterialStateProperty.all(
                Colors.indigoAccent,
              ),
            ),
          ),
          appBarTheme: const AppBarTheme(
            elevation: appBarElevation,
            backgroundColor: Colors.white,
          ),
          checkboxTheme: CheckboxThemeData(
            overlayColor: MaterialStateProperty.all(Colors.indigoAccent),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              visualDensity: const VisualDensity(),
            ),
          ),
          dividerTheme: const DividerThemeData(
            thickness: dividerThickness,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          )),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/response": (context) => ResponsePage(),
      },
    );
  }
}
