import 'package:covid_19_api/widgets/continer.dart';
import 'package:flutter/material.dart';
import '../widgets/counter_card_setting.dart';
import '../utils/styleConstant.dart';
import '../network/constUrl.dart';


class CounterCardStaticInfo extends StatelessWidget {
  final int infection; 
  final int recovry;
  final  int death;
  final String country;
  CounterCardStaticInfo({this.infection, this.recovry, this.death , this.country});
  @override
  Widget build(BuildContext context) {
    return   CustomContinerWidget(
      containerwidth: double.infinity,
      customWidget: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Counter(
          color: infectedColor,
          iconName: Icons.timeline,
          mainTitle: infection.toString().replaceAllMapped(reg, mathFun),
          subTitle: "Total Case",
          anothersubTitle: country,
        ),
        Counter(
          color: recovercolor,
          iconName: Icons.healing,
          mainTitle: recovry.toString().replaceAllMapped(reg, mathFun),
          subTitle: "Total Recovery",
          anothersubTitle: country,
        ),
        Counter(
          color: deathColor,
          iconName: Icons.airline_seat_individual_suite,
          mainTitle: death.toString().replaceAllMapped(reg, mathFun),
          subTitle: "Total Death",
          anothersubTitle:country,
        ),
      ],
    ),
  );
  }
}
