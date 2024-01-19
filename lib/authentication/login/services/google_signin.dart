import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../utils/routes/app_route_constants.dart';
import 'package:http/http.dart' as http;

Future<void> signIn(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignInApi.login();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final String accessToken = googleSignInAuthentication.accessToken!;
    final String? idToken = googleSignInAuthentication.idToken;
    print(googleSignInAuthentication);
    print("accessToken: $accessToken");
    print(googleSignInAccount);
    print("idToken: $idToken");
    await exchangeAccessToken(accessToken);
    context.goNamed(MyAppRouteConstants.HomeRouteName);

  } catch (error) {
    print(error);
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'openid',
    'profile',
  ],);
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logout() => _googleSignIn.disconnect();
  static Future<bool> isSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }
}

Future<void> exchangeAccessToken(String accessToken) async {
  final String baseUrl = dotenv.get('BaseUrl');
  final String url = '$baseUrl/api/v1/auth/oauthGoogle';

  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

  var body = {'token': accessToken};

  try {
    var response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
    }
  } catch (error) {
    print('Error: $error');
  }
}