import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../secreens/home.dart';
import '../secreens/about_me_secreen.dart';
import '../secreens/contact_secreen.dart';
import '../secreens/globally_info_secreen.dart';
import '../secreens/country_list_secreen.dart';

class Menu extends StatelessWidget {
  static const routeName = '/menu-secreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: OvalBottomBorderClipper(),
        child: Container(
          padding: EdgeInsets.only(left: 40, top: 35, right: 5),
          width: double.infinity,
          // height: double.infinity,
          decoration: BoxDecoration(
            // border: BoxBorder(),
            gradient: LinearGradient(
              colors: [
                Colors.indigo[400],
                Colors.indigo[300],
              ],
              // begin: Alignment.topRight,
              end: Alignment.centerRight,
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/virus2.png"),
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // Text(
                    //   "Close".toUpperCase(),
                    //   style: iconTextstyle,
                    // ),
                    IconButton(
                      color: Colors.white,
                      iconSize: 30.0,
                      icon: Icon(Icons.close, color: Colors.white,),
                      onPressed: null,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _menuItem(Icon(Icons.home), 'Syptoms & Prevention', context,
                        HomeSecreen.routeName),
                    _menuItem(Icon(Icons.public), 'Globally', context,
                        Globally.routeName),
                    _menuItem(Icon(Icons.location_on), 'Locally', context,
                        CountryList.routeName),
                    _menuItem(Icon(Icons.check_box), 'check up', context,
                        HomeSecreen.routeName),
                    _menuItem(Icon(Icons.contact_phone), 'Contact', context,
                        ContactUs.routeName),
                    _menuItem(Icon(Icons.person), 'About me', context,
                        AboutMe.routeName),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _menuItem(Icon icon, String text, BuildContext ctx, dynamic route) {
  return Container(
    constraints: BoxConstraints(),
    padding: EdgeInsets.only(bottom: 10.0, right: 30, left: 50),
    alignment: Alignment.center,
    child: InkWell(
      onTap: () {
        Navigator.of(ctx).pushNamed(route);
      },
      splashColor: Colors.amber,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(ctx).pushNamed(route);
            },
            iconSize: 40.0,
            icon: icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Text(
              text.toUpperCase(),
              style: menuTextstyle,
            ),
          ),
        ],
      ),
    ),
  );
}
