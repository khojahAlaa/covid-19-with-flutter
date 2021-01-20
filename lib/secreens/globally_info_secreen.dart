import 'package:covid_19_api/widgets/rankedCountry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/country.dart';
import '../network/constUrl.dart';
import '../widgets/continer.dart';
import '../widgets/counter_card_setting.dart';
import '../widgets/percentageChart.dart';
import '../utils/styleConstant.dart';
import '../widgets/clipHeader.dart';
import '../controller/callsApi.dart';
import '../model/global.dart';
import '../widgets/error_msg.dart';
import '../widgets/virus_loader_widget.dart';
import '../widgets/counter_card_inf.dart';
 import '../widgets/floatingUpButton.dart';

class Globally extends StatefulWidget {
  static const routeName = '/globally-info';

  @override
  _GloballyState createState() => _GloballyState();
}

class _GloballyState extends State<Globally> {
  final controller = ScrollController();
  double offset = 0;
  GlobalInfo _globaStats;
  List<Country> topTen;
  List<Country> lowTen;
  Country _worldStatsInfo;
  CallsApi api = CallsApi();
  bool isLoading = false;
  bool isLowSorting = false;
  bool isHighSorting = true;
  double deathPercentage;
  double activePercentage;
  double recoveryPercentage;

  static DateTime todayDate = DateTime.now();
  String formattedDate = DateFormat('EEE d MMM').format(todayDate);

  @override
  void initState() {
    super.initState();
     controller.addListener(onScroll);
    __fetchGlobalStats();
    __fetchRankedCountries();
    __fetchTodayWorldStats("world");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  void __fetchGlobalStats() async {
    setState(() {
      isLoading = true;
    });
    try {
      final stats = await api.getGlobalStatsInfo();

      deathPercentage = (stats.deaths / stats.cases) * 100;
      recoveryPercentage = (stats.recovered / stats.cases) * 100;
      activePercentage = 100 - (deathPercentage + recoveryPercentage);
      setState(() {
        _globaStats = stats;
        // seriesData = List<charts.Series<PercentageChartClass, String>>();
        // chartGeneratedData();
      });
    } catch (ex) {
      setState(() {
        _globaStats = null;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

// top ten

  void __fetchRankedCountries() async {
    setState(() {
      isLoading = true;
    });
    try {
      var allCountries = await api.getCountries();
      allCountries.sort((a, b) => a.cases.compareTo(b.cases));
      setState(
        () {
          topTen = allCountries.reversed.take(11).skip(1).toList();
          lowTen = allCountries.take(10).toList();
          // print("top ten  ${topTen.length}");
          // print(lowTen.length);
          // seriesData = List<charts.Series<RankedCountyChartClass, String>>();
          // _createSampleData();
        },
      );
    } catch (ex) {
      setState(
        () {
          topTen = null;
          lowTen = null;
        },
      );
    } finally {
      setState(
        () {
          isLoading = false;
        },
      );
    }
  }

  // global today cases
  void __fetchTodayWorldStats(world) async {
    setState(() {
      isLoading = true;
    });
    try {
      final worldStats = await api.getCountryStatsInfo(world);

      setState(() {
        _worldStatsInfo = worldStats;
      });
    } catch (ex) {
      setState(() {
        _worldStatsInfo = null;
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
      floatingActionButton:FloatingUPButton(controller),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipHeader(
              image: "assets/icons/world_is_mine.svg",
              textTop: "COVID-19,",
              textBottom: "Global Stats..",
              offset: offset,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: isLoading
                  ? VirusLoader()
                  : _globaStats == null
                      ? ErrorMessage()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "COVID-19 Total Case Updated",
                              style: titleTextstyle,
                            ),
                            const SizedBox(height: 10),
                            CounterCardStaticInfo(
                                infection: _globaStats.cases,
                                recovry: _globaStats.recovered,
                                death: _globaStats.deaths,
                                country: "Globally"),
                            const SizedBox(height: 10),
                            const Text(
                              "COVID-19 Globally Percentage",
                              style: titleTextstyle,
                            ),
                            const SizedBox(height: 10),
                            PercentageChart(
                              // _seriesData,
                              activePercentage,
                              recoveryPercentage,
                              deathPercentage,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Text(
                                  "COVID-19 Today Case Updated  ",
                                  style: titleTextstyle,
                                ),
                                Text(
                                  formattedDate,
                                  style: subTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            //today static cases
                            _worldStatsInfo == null
                                ? Container()
                                : _todayCasesStatic(context, _worldStatsInfo),
                            const SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Text(
                                  "COVID-19 Countries Ranks",
                                  style: titleTextstyle,
                                ),
                                Spacer(),
                                IconButton(
                                    icon: Icon(Icons.trending_up),
                                    color: infectedColor,
                                    onPressed: () {
                                      setState(() {
                                        isHighSorting = true;
                                        isLowSorting = false;
                                      });
                                    }),
                                IconButton(
                                    icon: Icon(Icons.trending_down),
                                    color: primaryColor,
                                    onPressed: () {
                                      setState(() {
                                        isLowSorting = true;
                                        isHighSorting = false;
                                      });
                                    }),
                              ],
                            ),
                            const SizedBox(height: 10),
                            topTen == null
                                ? Container()
                                : Visibility(
                                    visible: isHighSorting,
                                    child: RankedCountryChart(topTen),
                                  ),
                            SizedBox(height: 10),
                            lowTen == null
                                ? Container()
                                : Visibility(
                                    visible: isLowSorting,
                                    child: RankedCountryChart(lowTen),
                                  ),
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

Widget _todayCasesStatic(BuildContext ctx, Country _worldStatsInfo) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      CustomContinerWidget(
        // containerHeight: MediaQuery.of(ctx).size.width * 0.40,
        containerwidth: MediaQuery.of(ctx).size.width * 0.43,
        customWidget: Center(
          child: Counter(
            color: infectedColor,
            iconName: Icons.timeline,
            mainTitle: _worldStatsInfo.todayCases
                .toString()
                .replaceAllMapped(reg, mathFun),
            subTitle: "Today Cases",
            anothersubTitle: 'World',
          ),
        ),
      ),
      CustomContinerWidget(
        // containerHeight: MediaQuery.of(ctx).size.width * 0.40,
        containerwidth: MediaQuery.of(ctx).size.width * 0.43,
        customWidget: Center(
          child: Counter(
            color: deathColor,
            iconName: Icons.airline_seat_individual_suite,
            mainTitle: _worldStatsInfo.todayDeaths
                .toString()
                .replaceAllMapped(reg, mathFun),
            subTitle: "Today Deaths",
            anothersubTitle: 'World',
          ),
        ),
      ),
    ],
  );
}
