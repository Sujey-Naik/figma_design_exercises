import 'enums.dart';

extension GenderExtension on Gender {
  String? get name {
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

extension CountryExtension on Country {
  String? get name {
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
