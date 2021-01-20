import 'package:covid_19_api/secreens/country_detail_secreen.dart';
import 'package:covid_19_api/widgets/continer.dart';
import 'package:covid_19_api/widgets/error_msg.dart';
import 'package:covid_19_api/widgets/virus_loader_widget.dart';
import 'package:flutter/material.dart';
import '../model/country.dart';
import '../controller/callsApi.dart';
import '../utils/styleConstant.dart';
import '../widgets/searchBar_widget.dart';
import '../network/constUrl.dart';

class CountriesListView extends StatefulWidget {
  // CountriesListView(countriesList);

  @override
  _CountriesListViewState createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  CallsApi api = new CallsApi();
  List<Country> countriesList = List<Country>();
  bool isLoading = false;
  // final _searchController = new TextEditingController();
  var searchItems = List<Country>();

  @override
  void initState() {
    super.initState();
    __fetchAllCountries();
  }

  void __fetchAllCountries() async {
    setState(() {
      isLoading = true;
    });
    try {
      var allCountries = await api.getCountries();

      setState(() {
        countriesList = allCountries;
      });
    } catch (ex) {
      setState(() {
        countriesList = null;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

 void filterSearchResults(String queryText) {
    if (queryText.isNotEmpty) {
      List<Country> searchListData = List<Country>();
      countriesList.forEach((item) {
        if (item.countryName.toLowerCase().contains(queryText.toLowerCase()) ||
            item.countryName.toLowerCase().startsWith(queryText)) {
          searchListData.add(item);
        }
      });
      setState(() {
        searchItems.clear();
        searchItems.addAll(searchListData);
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchBarWidget(
          //_searchController.text, 
        filterSearchResults),
        Container(
          child: isLoading
              ? VirusLoader()
              : countriesList == null
                  ? ErrorMessage()
                  : ListView.separated(
                      shrinkWrap: true,
                      // This disables the scroll on ListView and new you can only scroll on the SingleChildScrollView
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: searchItems.length == 0
                          ? countriesList.length
                          : searchItems.length,
                      itemBuilder: (ctx, i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomContinerWidget(
                          //  containerHeight: 130,
                          containerwidth: double.infinity,
                          customWidget: ListTile(
                            onTap: () {
                              // _searchController.clear();
                              filterSearchResults('');
                              Navigator.of(context)
                                  // .pushNamed(
                                  //   CountryDetail.routeName,
                                  //   arguments: items.length == 0
                                  //       ? countriesList[i].countryName
                                  //       : items[i].countryName,
                                  // );

                                  .push(
                                MaterialPageRoute(
                                  builder: (context) => searchItems.length == 0
                                      ? CountryDetail(
                                          countriesList[i].countryName)
                                      : CountryDetail(
                                          searchItems[i].countryName,
                                        ),
                                ),
                              );
                            },
                            title: Row(
                              children: <Widget>[
                                searchItems.length == 0
                                    ? Text(
                                        countriesList[i].countryName.toString(),
                                        style: titleTextstyle.copyWith(
                                            color: primaryColor),
                                      )
                                    : Text(
                                        searchItems[i].countryName.toString(),
                                        style: titleTextstyle.copyWith(
                                            color: primaryColor),
                                      ),
                              ],
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Text(
                                  'Cases: ',
                                  style: bodyTextStyle.copyWith(
                                      color: infectedColor),
                                ),
                                searchItems.length == 0
                                    ? Text(
                                        countriesList[i]
                                            .cases
                                            .toString()
                                            .replaceAllMapped(reg, mathFun),
                                        style: subTextStyle,
                                      )
                                    : Text(
                                        searchItems[i]
                                            .cases
                                            .toString()
                                            .replaceAllMapped(reg, mathFun),
                                        style: subTextStyle,
                                      ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_right,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (ctx, i) {
                        return Divider();
                      },
                    ),
        ),
      ],
    );
  }
}
