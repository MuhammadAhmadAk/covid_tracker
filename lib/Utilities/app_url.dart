// ignore_for_file: prefer_interpolation_to_compose_strings

class AppUrl {
  //base URL
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';
//fetch world covid states
  static const String worldStateApi = baseUrl + 'all';
  static const String countriesList = baseUrl + 'Countries';
}
