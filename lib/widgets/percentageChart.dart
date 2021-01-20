import 'package:covid_19_api/widgets/continer.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../utils/styleConstant.dart';

class PercentageChartClass {
  String lable;
  double value;
  Color colorValue;

  PercentageChartClass({this.lable, this.value, this.colorValue});
}

class PercentageChart extends StatefulWidget {
  // final List<charts.Series<PercentageChartClass, String>> data;
  final double deathPercentage;
  final double activePercentage;
  final double recoveryPercentage;

  PercentageChart(
    // this.data,
    this.activePercentage,
    this.recoveryPercentage,
    this.deathPercentage,
  );

  @override
  _PercentageChartState createState() => _PercentageChartState();
}

class _PercentageChartState extends State<PercentageChart> {
  List<charts.Series<PercentageChartClass, String>> seriesData;
  chartGeneratedData() {
    var chartData = [
      new PercentageChartClass(
        lable: "Active",
        value: double.parse((widget.activePercentage).toStringAsFixed(2)),
        colorValue: infectedColor,
      ),
      new PercentageChartClass(
        lable: "Recovery",
        value: double.parse((widget.recoveryPercentage).toStringAsFixed(2)),
        colorValue: recovercolor,
      ),
      new PercentageChartClass(
        lable: "Death",
        value: double.parse((widget.deathPercentage).toStringAsFixed(2)),
        colorValue: deathColor,
      ),
    ];
    setState(
      () {
        seriesData.add(
          charts.Series(
            data: chartData,
            domainFn: (PercentageChartClass pchart, _) => pchart.lable,
            measureFn: (PercentageChartClass pchart, _) => pchart.value,
            colorFn: (PercentageChartClass pchart, _) =>
                charts.ColorUtil.fromDartColor(pchart.colorValue),
            id: "global percantage",
            labelAccessorFn: (PercentageChartClass row, _) => '${row.value}',
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // controller.addListener(onScroll);
    seriesData = List<charts.Series<PercentageChartClass, String>>();
    chartGeneratedData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContinerWidget(
      containerHeight: 300,
      containerwidth: double.infinity,
      customWidget: Expanded( 
        child:
      Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: charts.PieChart(
                seriesData,
                animate: true,
                animationDuration: Duration(seconds: 3),
                behaviors: [
                  new charts.DatumLegend(
                    position: charts.BehaviorPosition.bottom,
                    outsideJustification:
                        charts.OutsideJustification.middleDrawArea,
                    horizontalFirst: true,
                    showMeasures: true,
                    desiredMaxRows: 2,
                    cellPadding: new EdgeInsets.only(right: 45.0, bottom: 10.0),
                  ),
                ],
                defaultRenderer: new charts.ArcRendererConfig(
                  arcWidth: 40,
                  arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.outside)
                  ],
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


