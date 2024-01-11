import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl;

  ApiService(this.apiUrl);

  Future<Map<String, dynamic>> forgotPass(String email) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {'email': email};

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

  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {'email' : email, 'otp' : otp};

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
        throw Exception('Failed: ${response.body}');
      }
    } catch (error) {
      return {'success': false, 'error': 'Error: $error'};
    }
  }

  Future<Map<String, dynamic>> resetPass(String email, String pass) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {'email' : email, 'newPassword' : pass};

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
        throw Exception('Failed: ${response.body}');
      }
    } catch (error) {
      return {'success': false, 'error': 'Error: $error'};
    }
  }
}
