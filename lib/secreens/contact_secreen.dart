import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';
import '../widgets/clipHeader.dart';
import '../widgets/contact_card.dart';
import '../providers/calls_msg_url_service.dart';
import '../widgets/floatingUpButton.dart';



class ContactUs extends StatefulWidget {
  static const routeName = '/contact-us';

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipHeader(
              image: "assets/icons/calling.svg",
              textTop: "",
              textBottom: "Contact Us, App &Tell",
              offset: offset,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Never Ignore Any Syptoms, Contact MOH,\n You Will Be Directed To The Nearest Hospital',
                        style: headingTextStyle.copyWith(
                            color: primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                   
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  ContactCard(image: "assets/images/MOH12.PNG", title: "Ministry of Health", number: "937", iconName: Icons.phone_in_talk, functionCall:()=> call('937'),),
                  const SizedBox(height: 10,),
                  ContactCard(image: "assets/images/maweid.PNG", title: "Maweid App", number: "", iconName: Icons.mobile_screen_share, functionCall:()=>openURL("https://www.moh.gov.sa/eServices/Pages/cassystem.aspx")),
                  const SizedBox(height: 10,),
                  ContactCard(image: "assets/images/rest-assured.PNG", title: "Rest Assured App", number: "", iconName: Icons.mobile_screen_share, functionCall:()=>openURL("https://www.moh.gov.sa/eServices/Pages/Rest-assured.aspx")),

                  
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
