import 'package:covid_19_api/widgets/continer.dart';
import 'package:covid_19_api/widgets/error_msg.dart';
import 'package:covid_19_api/widgets/more_static_card.dart';
import 'package:covid_19_api/widgets/percentageChart.dart';
import 'package:covid_19_api/widgets/virus_loader_widget.dart';
import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';
import '../widgets/clipHeader.dart';
import '../controller/callsApi.dart';
import '../model/country.dart';
import '../widgets/counter_card_inf.dart';
import '../widgets/floatingUpButton.dart';

class CountryDetail extends StatefulWidget {
  final String countryName;
  CountryDetail(this.countryName);
  static const routeName = '/country-detail';

  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  final controller1 = ScrollController();
  double offset = 0;
  Country _countryStats;
  CallsApi api = CallsApi();
  bool isLoading = false;
  double deathPercentage;
  double activePercentage;
  double recoveryPercentage;

   void onScroll() {
    setState(() {
      offset = (controller1.hasClients) ? controller1.offset : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    controller1.addListener(onScroll);
    __fetchcountryStats(widget.countryName);
    //  print(_countryStats.cases);
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

 

  void __fetchcountryStats(countryName) async {
    setState(() {
      isLoading = true;
    });
    try {
      final stats = await api.getCountryStatsInfo(countryName);

      deathPercentage = (stats.deaths / stats.cases) * 100;
      recoveryPercentage = (stats.recovered / stats.cases) * 100;
      activePercentage = 100 - (deathPercentage + recoveryPercentage);
      setState(() {
        _countryStats = stats;
      });

      // print(_countryStats.todayCases);
      //  print(_countryStats.todayDeaths);

    } catch (ex) {
      setState(() {
        _countryStats = null;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingUPButton(controller1),
      body: SingleChildScrollView(
        controller: controller1,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipHeader(
              image: "assets/icons/around_the_world.svg",
              textTop: "COVID-19,",
              textBottom: widget.countryName.toString(),
              offset: offset,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: isLoading
                  ? VirusLoader()
                  : _countryStats == null
                      ? ErrorMessage()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "COVID-19 Case Updated",
                              style: titleTextstyle,
                            ),
                            const SizedBox(height: 10),
                            CounterCardStaticInfo(
                              infection: _countryStats.cases,
                              recovry: _countryStats.recovered,
                              death: _countryStats.deaths,
                              country: _countryStats.countryName,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "COVID-19 " + "Percentage",
                              style: titleTextstyle,
                            ),
                            const SizedBox(height: 10),
                            PercentageChart(
                              // _seriesData,
                              activePercentage,
                              recoveryPercentage,
                              deathPercentage,
                            ),
                            SizedBox(height: 10),
                            const Text(
                              "More Static Information",
                              style: titleTextstyle,
                            ),
                            const SizedBox(height: 10),
                            _moreStaticInformatuon(_countryStats),
                            SizedBox(height: 30),
                          ],
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _moreStaticInformatuon(_countryStats) {
  return CustomContinerWidget(
    containerHeight: 470,
    customWidget: Column(
      children: <Widget>[
        MoreStatic(
          color: infectedColor,
          iconName: Icons.restore,
          title: "Active Cases",
          number: _countryStats.activeCases== null? "0": _countryStats.activeCases.toString(),
        ),
        Divider(color: Colors.indigo[300]),
        MoreStatic(
          color: recovercolor,
          iconName: Icons.done_all,
          title: "Total Tests",
          number: _countryStats.totalTests==null? "0": _countryStats.totalTests.toString(),
        ),
        Divider(color: Colors.indigo[300]),
        MoreStatic(
          color: primaryColor,
          iconName: Icons.title,
          title: "Tests Per One Million",
          number: _countryStats.testsPerOneMillion== null? "0": _countryStats.testsPerOneMillion.toString(),
        ),
        Divider(color: Colors.indigo[300]),
        MoreStatic(
          color: infectedColor,
          iconName: Icons.timeline,
          title: "Cases Per One Million",
          number:_countryStats.casesPerOneMillion==null?"0": _countryStats.casesPerOneMillion.toString(),
        ),
        Divider(color: Colors.indigo[300]),
        MoreStatic(
          color: deathColor,
          iconName: Icons.airline_seat_individual_suite,
          title: "Deaths Per One Million",
          number: _countryStats.deathsPerOneMillion==null?"0":_countryStats.deathsPerOneMillion.toString(),
        ),
        Divider(color: Colors.indigo[300]),
        MoreStatic(
          color: titleTextColor,
          iconName: Icons.report,
          title: "Critical Cases",
          number: _countryStats.critical==null?"0": _countryStats.critical.toString(),
        ),
        // Divider(color: Colors.indigo[300]),
      ],
    ),
  );
}
