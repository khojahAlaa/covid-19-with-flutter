import 'package:http/http.dart' as http;
import 'dart:io';
import '../network/constUrl.dart';
import 'dart:convert';
import '../model/global.dart';
import '../model/country.dart';

class CallsApi {
  Future<GlobalInfo> getGlobalStatsInfo() async {
    try {
      final response = await http.get(UrlConstants.globalInfoURL);
      final extractedStats = json.decode(response.body) as Map<String, dynamic>;

      checkAndThrowError(response);

      return new GlobalInfo(
        extractedStats['cases'],
        extractedStats['recovered'],
        extractedStats['deaths'],
      );
    } catch (error) {
      throw error;
    }
  }

  Future<List<Country>> getCountries() async {
    try {
      final response = await http.get(UrlConstants.allCountriesURL);
      final countriesList = json.decode(response.body) as List;
      checkAndThrowError(response);
      return countriesList
          .map((country) => Country(
                countryName: country['country'],
                cases: country['cases'],
                todayCases: country['todayCases'],
                deaths: country['deaths'],
                todayDeaths: country['todayDeaths'],
                recovered: country['recovered'],
                activeCases: country['active'],
                critical: country['critical'],
                casesPerOneMillion: country['casesPerOneMillion'],
                deathsPerOneMillion: country['deathsPerOneMillion'],
                totalTests: country['totalTests'],
                testsPerOneMillion: country['testsPerOneMillion'],
              ))
          .toList();
      
    } catch (error) {
      throw error;
    }
  }

  Future<Country> getCountryStatsInfo(String selectedCountryName) async {
    try {
      final response = await http
          .get('${UrlConstants.allCountriesURL}/$selectedCountryName');
      final countryDetail = json.decode(response.body) as Map<String, dynamic>;

      checkAndThrowError(response);

      return new Country(
        countryName: countryDetail['country'],
        cases: countryDetail['cases'],
        todayCases: countryDetail['todayCases'],
        deaths: countryDetail['deaths'],
        todayDeaths: countryDetail['todayDeaths'],
        recovered: countryDetail['recovered'],
        activeCases: countryDetail['active'],
        critical: countryDetail['critical'],
        casesPerOneMillion: countryDetail['casesPerOneMillion'],
        deathsPerOneMillion: countryDetail['deathsPerOneMillion'],
        totalTests: countryDetail['totalTests'],
        testsPerOneMillion: countryDetail['testsPerOneMillion'],
      );
    } catch (error) {
      throw error;
    }
  }
}

void checkAndThrowError(http.Response response) {
  if (response.statusCode != HttpStatus.ok) throw Exception(response.body);
}
