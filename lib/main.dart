import 'package:connectify/authentication/signup/provider/signup_provider.dart';
import 'package:connectify/utils/contants/colors/app_colors.dart';
import 'package:connectify/utils/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'authentication/login/provider/login_provider.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => SignupProvider()),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Connectify',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'SFPRODISPLAY',
              color: AppColors.textColor
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}

