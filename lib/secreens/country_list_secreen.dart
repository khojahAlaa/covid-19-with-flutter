import 'package:covid_19_api/widgets/countries_list_view_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/clipHeader.dart';
import '../widgets/floatingUpButton.dart';


class CountryList extends StatefulWidget {
  static const routeName = '/country-list';

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
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
              image: "assets/icons/around_the_world.svg",
              textTop: "COVID-19,",
              textBottom: "Country List..",
              offset: offset,
            ),
            const SizedBox(height: 10),
            
            CountriesListView(),
          ],
        ),
      ),
    );
  }
}
