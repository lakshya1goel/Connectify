import 'package:connectify/authentication/login/services/google_signin.dart';
import 'package:connectify/utils/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'authentication/login/services/storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SecureStorage secureStorage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async{
            if (await GoogleSignInApi.isSignedIn()) {
              await GoogleSignInApi.logout();
            }
            await secureStorage.deleteSecureData('accessToken');
            await secureStorage.deleteSecureData('refreshToken');
            context.goNamed(MyAppRouteConstants.LoginRouteName);
          },
          child: Text("LogOut", style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
