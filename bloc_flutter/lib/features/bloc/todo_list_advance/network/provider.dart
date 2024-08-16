import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  Future<List<dynamic>> FetchApiList() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/'),
      );
      print('ResponseCode is ${response.statusCode}');
      List<dynamic> decodedResponse = jsonDecode(response.body);
      return decodedResponse;
    } finally {
      client.close();
    }
  }
}
