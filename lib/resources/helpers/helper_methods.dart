import '../enums/enums.dart';

class CountryHelper{
  CountryHelper._();
  static Country getCountry(String? name) {
    switch (name) {
      case "India":
        return Country.india;
      case "China":
        return Country.china;
      case "England":
        return Country.england;
      default:
        throw Exception("Unknown country value");
    }
  }

  static String? getCountryName(Country? country){
    switch (country) {
      case Country.india:
        return "India";
      case Country.china:
        return "China";
      case Country.england:
        return "England";
      default:
        return null;
    }
  }
}
