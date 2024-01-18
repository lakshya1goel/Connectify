import 'package:connectify/utils/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'authentication/login/services/storage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorage secureStorage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000),()async{
      context.goNamed(MyAppRouteConstants.LoginRouteName);
      // String? token = await accessToken;
      // if(token == null && context.mounted){
      //   context.go('/login');
      // }
      // else{
      //   bool isAuthenticated = await LoginUser().verifyToken(token!);
      //   if(isAuthenticated && context.mounted){
      //     context.go('/dashboard');
      //   }
      //   else{
      //     context.go('/login');
      //   }
      // }
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
