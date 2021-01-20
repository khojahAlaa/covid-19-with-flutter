import 'package:covid_19_api/widgets/continer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../providers/calls_msg_url_service.dart';

import '../utils/styleConstant.dart';
import '../widgets/clipHeader.dart';
import '../widgets/user_info.dart';
import '../widgets/counter_card_setting.dart';
import '../widgets/floatingUpButton.dart';


class AboutMe extends StatefulWidget {
  static const routeName = '/about-me';

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
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
      floatingActionButton: FloatingUPButton(controller),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipHeader(
              image: "assets/icons/personal_information.svg",
              textTop: "Personal",
              textBottom: "Information",
              offset: offset,
            ),
            _nameAndSocialContactButton(),
             Center(child: SizedBox(height: 10, width: 250.0,child: Divider(color: primaryColor,),),),
             SizedBox(height: 10,),
            _historyAndMoreInfo(),
            _tail(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

IconButton contactButton({IconData iconName, VoidCallback funName}) {
  return IconButton(
    icon: FaIcon(iconName),
    color: Colors.amber,
    onPressed: () {
      funName();
    },
  );
}

Widget _nameAndSocialContactButton() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Alaa A Khojah',
              style: headingTextStyle.copyWith(color: primaryColor),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'alaa.a.khojah@hotmail.com',
            style: subTextStyle,
            // TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              contactButton(
                iconName: FontAwesomeIcons.twitter,
                funName: () => twitterURL("aaakhojah"),
              ),
              contactButton(
                iconName: FontAwesomeIcons.github,
                funName: () => githubURL("alaaKhojah"),
              ),
              contactButton(
                iconName: FontAwesomeIcons.linkedin,
                funName: () => linkedinURL("alaa-abdulaziz-khojah-8a0b1815b"),
              ),
              contactButton(
                iconName: FontAwesomeIcons.at,
                funName: () => sendEmail("alaa.a.khojah@hotmail.com"),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _counterCard() {
  return CustomContinerWidget(
      containerwidth: double.infinity,
      customWidget:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Counter(
          color: infectedColor,
          iconName: Icons.calendar_today,
          mainTitle: "Infection",
          subTitle: "24/4/2020",
          anothersubTitle: "1th Ramadan",
        ),
        Counter(
          color: primaryColor,
          iconName: Icons.calendar_today,
          mainTitle: "Quarantine",
          subTitle: "28/4/2020",
          anothersubTitle: "5th Ramadan",
        ),
        Counter(
          color: recovercolor,
          iconName: Icons.calendar_today,
          mainTitle: "Recovery",
          subTitle: "21/5/2020",
          anothersubTitle: "28th Ramadan",
        ),
      ],
    ),
  );
}

Widget _historyAndMoreInfo() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "My History with COVID-19",
          style: titleTextstyle,
        ),
        const SizedBox(height: 10),
        _counterCard(),
        const SizedBox(height: 10),
        const Text(
          "More Information",
          style: titleTextstyle,
        ),
        const SizedBox(height: 10),
        UserInfo(),
      ],
    ),
  );
}

Widget _tail() {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Built with ',
            style: subTextStyle,
          ),
          Icon(
            Icons.favorite,
            color: Colors.amber,
          ),
          Text(
            '  Flutter',
            style: subTextStyle,
          )
        ],
      ),
      Text(
        'During quarantine period',
        style: subTextStyle,
      ),
    ],
  );
}
