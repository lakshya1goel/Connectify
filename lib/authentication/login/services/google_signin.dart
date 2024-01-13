import 'dart:convert';

import 'package:flutter/material.dart';
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
    print("---------------------------------------------");
    print(accessToken);
    print(googleSignInAccount);
    print(idToken);
    print("---------------------------------------------");
    // exchangeAccessToken(accessToken);
    context.goNamed(MyAppRouteConstants.HomeRouteName);

  } catch (error) {
    print("-----------------++++++++++++++++----------------------------");
    print(error);
    print("-----------------+++++++++++++++++++++----------------------------");
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logout() => _googleSignIn.disconnect();
}

// void exchangeAccessToken(String accessToken) async {
//   final String url = 'https://vroom-vroom-fyiv.onrender.com/auth/exchange/';
//
//   final Map<String, String> headers = {
//     'accept': 'application/json',
//     'Content-Type': 'application/json',
//   };
//
//   final Map<String, String> data = {
//     'access_token': accessToken,
//   };
//
//   final String jsonData = jsonEncode(data);
//
//   try {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: headers,
//       body: jsonData,
//     );
//
//     if (response.statusCode == 200) {
//       print('Response: ${response.body}');
//     } else {
//       print('Error: ${response.statusCode}, ${response.body}');
//     }
//   } catch (error) {
//     print('Error: $error');
//   }
// }