import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';

class CustomContinerWidget extends StatelessWidget {
  final Widget customWidget;
  final double containerHeight;
  final double containerwidth;
  CustomContinerWidget({this.customWidget, this.containerHeight, this.containerwidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(10),
      width: containerwidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color:cardColor,
        // color: Colors.grey[200],
        gradient: LinearGradient(
          colors: [
            Colors.indigo[50],
            cardColor,
          ],
          begin: Alignment.topRight,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        children: <Widget>[customWidget],
      ),
    );
  }
}
