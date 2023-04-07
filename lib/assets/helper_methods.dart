import 'enums.dart';

Country? getCountry(String? name) {
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
