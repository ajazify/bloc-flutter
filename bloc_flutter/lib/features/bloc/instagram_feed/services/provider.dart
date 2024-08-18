import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  Future<Map<String, dynamic>> FetchApiList(String queryParams) async {
    var client = http.Client();
    try {
      var response = await client.get( 
          headers: {'Authorization': 'UD8ME2D7mu8es2EfmTEztdv627oO1O7YnW6iopO4HPRcigSLxMw5jwG1'},
          Uri.parse('https://api.pexels.com/v1/search?query=$queryParams'));
      Map<String, dynamic> rawResponse = jsonDecode(response.body); 
      return rawResponse;
    } finally {  
      client.close();
    }
  }
}
