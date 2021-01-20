import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../utils/styleConstant.dart';

class CovidWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.topLeft,
      // padding: const EdgeInsets.all(40),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.indigo[50],
            cardColor,
          ],
          begin: Alignment.topRight,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child:
          // child: Image(
          //   width: double.infinity,

          //   image: AssetImage(
          //     'assets/images/connected_world.png',
          //   ),
          //   fit: BoxFit.fill,
          //   // color: Theme.of(context).accentColor,
          // ),
          WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://www.bing.com/covid/local/raipur_chhattisgarh_india?form=C19ANS',

            ),
          ),
    );
  }
}
