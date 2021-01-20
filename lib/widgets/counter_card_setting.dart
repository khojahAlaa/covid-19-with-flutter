import 'package:covid_19_api/utils/styleConstant.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final Color color;
  final IconData iconName;
  final String mainTitle;
  final String subTitle;
  final String anothersubTitle;

  const Counter(
      {Key key,
      this.color,
      this.iconName,
      this.mainTitle,
      this.subTitle,
      this.anothersubTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 20,
          backgroundColor: color.withOpacity(.26),
          child: Icon(
            iconName,
            size: 18.0,
            color: color,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          mainTitle,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(subTitle, style: bodyTextStyle),
        Text(anothersubTitle, style: subTextStyle),
      ],
    );
  }
}
