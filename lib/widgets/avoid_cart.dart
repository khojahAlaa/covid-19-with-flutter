import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';
import '../widgets/continer.dart';

class AvoidCard extends StatelessWidget {
  final String imageAvoid;
  final String text;
  final String letter;
  const AvoidCard({Key key, this.imageAvoid, this.text, this.letter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomContinerWidget(
       containerHeight: 135,
      containerwidth: 150,
      customWidget:
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(imageAvoid),
            backgroundColor: Colors.transparent,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                letter,
                style: titleTextstyle.copyWith(color: Colors.red),
              ),
              const SizedBox(width: 10),
              Text(text),
            ],
          ),
        ],
      ),
    );
  }
}
