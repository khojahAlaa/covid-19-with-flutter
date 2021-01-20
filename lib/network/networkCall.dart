// import 'package:http/http.dart' as http;
// import 'dart:io';

// class NetworkCall {
//   Future<String> httpGet(String url) async {
//     var response = await http.get(url);

//     checkAndThrowError(response);
//     return response.body;
//   }

//   static void checkAndThrowError(http.Response response) {
//     if (response.statusCode != HttpStatus.ok) throw Exception(response.body);
//   }
// }
