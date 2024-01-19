import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<bool> verifyAccessToken(String? accessToken) async {
  String? token = accessToken;
  final String baseUrl = dotenv.get('BaseUrl');
  final String url = '$baseUrl/api/v1/test';

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return true;
    } else {
      print('Response status: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}