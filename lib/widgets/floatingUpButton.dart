import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';

class FloatingUPButton extends StatelessWidget {
  final controller ;
  FloatingUPButton(this.controller);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(
          Icons.keyboard_arrow_up,
          color: Colors.amber,
        ),
        onPressed: () {
          controller.animateTo(0.0,
              duration: Duration(seconds: 1), curve: Curves.easeInOut);
        },
      );
  }
}