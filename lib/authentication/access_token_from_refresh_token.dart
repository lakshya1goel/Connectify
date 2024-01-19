import 'dart:convert';
import 'package:connectify/authentication/access_token_from_refresh_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<AccessTokenFromRefreshTokenModel?> fetchAccessToken(String? token) async {
  final String baseUrl = dotenv.get('BaseUrl');
  final String url = '$baseUrl/api/v1/auth/regenerateToken?token=$token';

  try {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      return AccessTokenFromRefreshTokenModel.fromJson(responseData);
    } else {
      print('Error: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}