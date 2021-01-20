import 'package:flutter/material.dart';
import '../utils/ovarl-right-clipper.dart';


class AppDrawer extends StatelessWidget {
  final Color primary = Colors.pink[50];
  final Color active = Colors.teal[900];
  final Color divider = Colors.grey.shade600;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [active, primary])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: null,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "erika costell",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "@erika07",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(context, Icons.shop, "shop",  '/'),
                  _buildDivider(),
                  _buildRow(context, Icons.person_pin, "My profile", '/'),
                  _buildDivider(),
                  _buildRow(
                    context,
                    Icons.payment,
                    "Order",
                     '/'
                  ),
                  _buildDivider(),
                  // _buildRow(
                  //   context,
                  //   Icons.shopping_cart,
                  //   "Cart", CartSecreen.routeName,
                  // ),
                  // _buildDivider(),
                  _buildRow(context, Icons.settings, "Manage Your Products",'/' ),
                  _buildDivider(),
                  _buildRow(context, Icons.email, "Contact us", '/'),
                  _buildDivider(),
                  _buildRow(context, Icons.info_outline, "Help", '/'),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(BuildContext c, IconData icon, String title,
      dynamic route) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child:
            // ListTile(
            //       leading: Icon(icon),
            //       title: Text('title'),
            //       onTap: () {
            //         Navigator.of(c).pushReplacementNamed('routeName');
            //       },
            //     ),
            GestureDetector(
          onTap: () {
           Navigator.of(c).pushReplacementNamed(route) ;
          },
          child: Row(children: [
            Icon(
              icon,
              color: active,
            ),
            SizedBox(width: 10.0),
            Text(
              title,
              style: tStyle,
            ),
          ]),
        ));
  }
}
