class Country {
  String countryName;
  int cases;
  int todayCases;
  int recovered;
  int deaths;
  int todayDeaths;
  int activeCases;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int totalTests;
  int testsPerOneMillion;
  Country({
    this.countryName,
    this.cases,
    this.todayCases,
    this.recovered,
    this.deaths,
    this.todayDeaths,
    this.activeCases,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.totalTests,
    this.testsPerOneMillion,
  });
}

class HomeCountry {
  final String name;
  final String cases;
  final String deaths;

  HomeCountry({
    this.name,
    this.cases,
    this.deaths,
  });
}
