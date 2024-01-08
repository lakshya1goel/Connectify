import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl;

  ApiService(this.apiUrl);

  Future<Map<String, dynamic>> registerUser(String name, String email, String password) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {'name' : name, 'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        print(response.body);
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (error) {
      return {'success': false, 'error': 'Error: $error'};
    }
  }
}
