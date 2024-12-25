

import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestAssistance {
  static Future<dynamic> receiveRequest(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Successful request, parse the JSON response
        return json.decode(response.body);
      } else {
        // Request failed, return the status code and potentially the error message
        // You can customize how you handle errors based on your application's needs.
        print('Request failed with status: ${response.statusCode}.');
        return {'error': 'Request failed', 'statusCode': response.statusCode, 'body': response.body}; // Return error details
      }
    } catch (e) {
      // Handle exceptions, such as network errors
      print('Error during request: $e');
      return {'error': 'Exception during request', 'exception': e.toString()}; // Return exception details
    }
  }
}