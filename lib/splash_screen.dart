import 'package:connectify/authentication/access_token_from_refresh_token.dart';
import 'package:connectify/utils/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'authentication/access_token_from_refresh_model.dart';
import 'authentication/login/services/storage.dart';
import 'authentication/verify_access_token.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorage secureStorage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000),() async{
      String? accessToken = await secureStorage.readSecureData('accessToken');
      String? refreshToken = await secureStorage.readSecureData('refreshToken');
      bool verify = await verifyAccessToken(accessToken);
      if(accessToken == null) {
        context.goNamed(MyAppRouteConstants.LoginRouteName);
      }
      else if (verify) {
        context.goNamed(MyAppRouteConstants.HomeRouteName);
      }
      else {
        AccessTokenFromRefreshTokenModel? accessTokenFromRefreshToken = await fetchAccessToken(refreshToken);
        if(accessTokenFromRefreshToken!.success == false) {
          context.goNamed(MyAppRouteConstants.LoginRouteName);
        }
        else {
          secureStorage.writeSecureData('accessToken', accessTokenFromRefreshToken.myAccessToken);
          context.goNamed(MyAppRouteConstants.HomeRouteName);
        }
      }
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/splash_screen.png",
                height: size.height*0.35,
              ),
            ],
          ),
        )
    );
  }
}
