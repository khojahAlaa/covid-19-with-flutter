import 'package:covid_19_api/widgets/continer.dart';
import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomContinerWidget(
            containerwidth: double.infinity,
            customWidget: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // ...ListTile.divideTiles(
                    //   color: Colors.grey,
                    //   tiles: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.amber,
                        child: Icon(
                          Icons.book,
                          size: 18.0,
                          color: Colors.indigo[400],
                        ),
                      ),
                      // const Icon(
                      //   Icons.book,
                      //   color: Colors.amber,
                      // ),
                      title: Text(
                        "EDUCATION",
                        style: titleTextstyle.copyWith(color: primaryColor),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "- Bachelor's in Health Informatics.",
                          ),
                          const Text(
                            "- Diploma in Computer Technology \n  Specialized In Programing.",
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.indigo[300]),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.amber,
                        child: Icon(
                          Icons.laptop_chromebook,
                          size: 18.0,
                          color: Colors.indigo[400],
                        ),
                      ),
                      title: Text(
                        "TECHNICAL SKILLS",
                        style: titleTextstyle.copyWith(color: primaryColor),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("- Database MySQL".toUpperCase(),
                              style: bodyTextStyle),
                          Text("- Junior web developer".toUpperCase(),
                              style: bodyTextStyle),
                          const Text("  (Laravel & vue.js framework)."),
                          Text("- Junior App developer".toUpperCase(),
                              style: bodyTextStyle),
                          const Text("  (cross-platform- flutter)."),
                        ],
                      ),
                    ),
                    Divider(color: Colors.indigo[300]),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.amber,
                        child: Icon(
                          Icons.more,
                          size: 18.0,
                          color: Colors.indigo[400],
                        ),
                      ),
                      title: Text(
                        "INTERESTS",
                        style: titleTextstyle.copyWith(color: primaryColor),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text("- E-health."),
                          const Text("- Internet Of medical Things."),
                          const Text(
                              "- Artificial Intelligence in healthCare."),
                          const Text("- Data Analysis."),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
            //   ],
            // ),
            ),
        const SizedBox(height: 30),
      ],
    );
  }
}
