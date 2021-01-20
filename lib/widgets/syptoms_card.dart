import 'package:flutter/material.dart';
import '../widgets/continer.dart';

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   
      CustomContinerWidget(
      // containerHeight: 300,
      containerwidth: 150,
      customWidget:Center(
        child: Column(
          children: <Widget>[
            Image.asset(image, height: 90),
            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}
