import 'package:covid_19_api/widgets/continer.dart';
import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';

class ContactCard extends StatelessWidget {
  final String image;
  final String title;
  final String number;
  final String appName;
  final VoidCallback functionCall;
  final IconData iconName;
  const ContactCard(
      {Key key,
      this.image,
      this.title,
      this.number,
      this.appName,
      this.iconName,
      this.functionCall})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContinerWidget(
      containerwidth: double.infinity,
      customWidget: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(image),
            backgroundColor: Colors.white,
          ),

          //         ClipOval(
          //    child: Image.asset(
          //     image,
          //      fit: BoxFit.contain,
          //     //  matchTextDirection: true,
          //      height: 80,
          //      width: 80,
          //  )),

          Container(
            height: 80,
            child: VerticalDivider(color: Colors.indigo[300], width: 40),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 50,
              ),
              Text(
                title,
                style: titleTextstyle,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                number,
                style: titleTextstyle.copyWith(color: primaryColor),
              ),
            ],
          ),
          Divider(color: Colors.indigo[300]),
          Spacer(),
          IconButton(
            icon: Icon(
              iconName,
              size: 30,
            ),
            onPressed: () {
              //import from providers/calls_msg_url_service.dart
              functionCall();
            },
            color: Colors.amber,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
