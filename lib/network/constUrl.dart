import 'package:http/http.dart';
// import './networkCall.dart';

abstract class UrlConstants {
  static const String baseURL = 'https://coronavirus-19-api.herokuapp.com';
  static const String globalInfoURL = '$baseURL/all';
  static const String allCountriesURL = '$baseURL/countries';
}
//create the object of this Client() of http packages
//making multiple requests to the same server, 
//you can keep open a persistent connection by using a Client rather than making one-off requests.
final client = Client();
//create the object of this NetworkCall class to be used in controller
// final netWorkCalls = NetworkCall();
// used with replaceAllMapped() method to sperate number with comma like 3,678,677
final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
final Function mathFun = (Match match) => '${match[1]},';

