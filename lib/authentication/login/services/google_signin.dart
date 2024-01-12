import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../utils/routes/app_route_constants.dart';

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