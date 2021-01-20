import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';

class FlotingButtonWidget extends StatelessWidget {

    final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(
          Icons.keyboard_arrow_up,
          color: Colors.amber,
        ),
        onPressed: () {
          print("object");
          controller.animateTo(0.0,
              duration: Duration(seconds: 1), curve: Curves.easeInOut);
        },
      );
  }
}