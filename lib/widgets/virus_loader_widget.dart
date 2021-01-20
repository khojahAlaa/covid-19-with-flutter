import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class VirusLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // widthFactor: 80,
      heightFactor: 5,
      child: HeartbeatProgressIndicator(
        child: SizedBox(
          height: 50.0,
          child: Image(
            image: AssetImage(
              'assets/images/loader.png',
            ),
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
