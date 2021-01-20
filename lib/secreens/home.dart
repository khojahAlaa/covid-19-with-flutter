import 'package:covid_19_api/widgets/preventation_card.dart';
import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';
import '../widgets/clipHeader.dart';
import '../widgets/syptoms_card.dart';
import '../widgets/avoid_cart.dart';
import '../widgets/floatingUpButton.dart';


class HomeSecreen extends StatefulWidget {
  static const routeName = '/home-secreen';

  @override
  _HomeSecreenState createState() => _HomeSecreenState();
}

class _HomeSecreenState extends State<HomeSecreen> {
   final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:  FloatingUPButton(controller),
      body: SingleChildScrollView(
         controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipHeader(
              image: "assets/icons/undraw_medical.svg",
              textTop: "Get to know",
              textBottom: "About Covid-19.",
              offset: offset,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Syptoms",
                    style: titleTextstyle,
                  ),
                  const SizedBox(height: 20),
                  ////////////////////////////
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/Cough.png",
                          title: "Cough".toUpperCase(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "headache".toUpperCase(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SymptomCard(
                          image: "assets/images/high-fever.png",
                          title: "high fever 38°".toUpperCase(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SymptomCard(
                          image: "assets/images/nausea-vomiting.png",
                          title: "vomiting".toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ///////////////////////////////
                  Row(
                    children: <Widget>[
                      const Text("Avoid touching ", style: titleTextstyle),
                      Text(
                        "MEN",
                        style: titleTextstyle.copyWith(color: Colors.red),
                      ),
                      const Text(" to stop spread COVID-19",
                          style: subTextStyle),
                    ],
                  ),

                  const SizedBox(height: 20),
                  /////////////////////////////////////
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AvoidCard(
                          imageAvoid: "assets/images/mouthh.PNG",
                          text: "Mouth",
                          letter: "M -",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AvoidCard(
                          imageAvoid: "assets/images/eye.PNG",
                          text: "Eye",
                          letter: "E -",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AvoidCard(
                          imageAvoid: "assets/images/nose.PNG",
                          text: "Nose",
                          letter: "N -",
                        ),
                      ],
                    ),
                  ),
                  /////////////////////////////////////////////////
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      const Text("Follow ", style: titleTextstyle),
                      Text(
                        "WOMEN",
                        style: titleTextstyle.copyWith(color: recovercolor),
                      ),
                      const Text(" to prevent COVID-19 ", style: subTextStyle),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //////////////////////////////////////////////////
                  PreventationCard(
                    image: "assets/images/wash-hands.png",
                    text: "Wash Your Hands",
                    letter: "W -",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PreventationCard(
                    image: "assets/images/social_distancing.png",
                    text: "Obey Social Distancing",
                    letter: "O -",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PreventationCard(
                    image: "assets/images/mask.png",
                    text: "Mask To Be Used \n Properly",
                    letter: "M -",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PreventationCard(
                    image: "assets/images/clean.png",
                    text: "Everything Must \n Cleaned Well",
                    letter: "E -",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PreventationCard(
                    image: "assets/images/see-dr.png",
                    text: "Never Ignore Syptoms \n And See Doctor",
                    letter: "N -",
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
