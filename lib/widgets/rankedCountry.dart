import 'package:covid_19_api/controller/callsApi.dart';
import 'package:covid_19_api/model/country.dart';
import 'package:covid_19_api/network/constUrl.dart';
import 'package:covid_19_api/utils/styleConstant.dart';
import 'package:covid_19_api/widgets/continer.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RankedCountyChartClass {
  String lable;
  double value;
  Color colorValue;

  RankedCountyChartClass(this.lable, this.value, this.colorValue);
}

class RankedCountryChart extends StatefulWidget {
  final List<Country> rankedCountry;
  RankedCountryChart(this.rankedCountry);
  @override
  _RankedCountryChartState createState() => _RankedCountryChartState();
}

class _RankedCountryChartState extends State<RankedCountryChart> {
  CallsApi api = CallsApi();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // __fetchRankedCountries();
    seriesData = List<charts.Series<RankedCountyChartClass, String>>();
    _createSampleData();
  }

  List<charts.Series<RankedCountyChartClass, String>> seriesData;
  _createSampleData() {
    List<RankedCountyChartClass> rankedCountriesData = [];
    if (widget.rankedCountry.length != null) {
      for (var i in widget.rankedCountry) {
        RankedCountyChartClass r = new RankedCountyChartClass(
            i.countryName, i.cases.toDouble(), primaryColor);
        rankedCountriesData.add(r);
      }
    }

    setState(() {
      seriesData.add(charts.Series(
          id: 'RankedCountriesName',
          domainFn: (RankedCountyChartClass countryName, _) =>
              countryName.lable,
          measureFn: (RankedCountyChartClass countryName, _) =>
              countryName.value,
          colorFn: (RankedCountyChartClass countryName, _) =>
              charts.ColorUtil.fromDartColor(countryName.colorValue),
          data: rankedCountriesData,
          labelAccessorFn: (RankedCountyChartClass countryName, _) =>
              '(${countryName.value.toString().replaceAllMapped(reg, mathFun)})'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContinerWidget(
      containerHeight: 300,
      containerwidth: double.infinity,
      customWidget: Expanded(
        child: isLoading
            ? Container()
            : Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: charts.BarChart(
                        seriesData,
                        animate: true,
                        vertical: false,
                        barRendererDecorator: new charts.BarLabelDecorator(
                          outsideLabelStyleSpec: new charts.TextStyleSpec(
                            color:
                                charts.ColorUtil.fromDartColor(infectedColor),
                          ),
                          insideLabelStyleSpec: new charts.TextStyleSpec(
                            color:
                                charts.ColorUtil.fromDartColor(infectedColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
