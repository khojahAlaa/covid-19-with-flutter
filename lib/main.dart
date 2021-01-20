import 'package:covid_19_api/secreens/country_list_secreen.dart';
import 'package:flutter/material.dart';
import './utils/theme.dart';
import './secreens/home.dart';
import './secreens/about_me_secreen.dart';
import './secreens/Menu.dart';
import './secreens/contact_secreen.dart';
import './secreens/globally_info_secreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19-app',
      theme: lightTheme,
      home: HomeSecreen(),
      routes: {
        HomeSecreen.routeName: (ctx) => HomeSecreen(),
        Menu.routeName: (ctx) => Menu(),
        AboutMe.routeName: (ctx) => AboutMe(),
        ContactUs.routeName: (ctx) => ContactUs(),
        Globally.routeName: (ctx) => Globally(),
        CountryList.routeName: (ctx) => CountryList(),
      },
    );
  }
}
