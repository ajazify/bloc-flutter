import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  Future<Map<String, dynamic>> FetchApiList(String queryParams) async {
    var client = http.Client();
    try {
      var response = await client.get( 
          headers: {'Authorization': '<Your Pexels Api Key Generated>'},
          Uri.parse('https://api.pexels.com/v1/search?query=$queryParams'));
      Map<String, dynamic> rawResponse = jsonDecode(response.body); 
      return rawResponse;
    } finally {  
      client.close();
    }
  }
}
