import 'package:connectify/utils/contants/colors/app_colors.dart';
import 'package:connectify/views/screens/authentication/login.dart';
import 'package:connectify/views/screens/authentication/signup.dart';
import 'package:flutter/material.dart';

import 'views/screens/authentication/otpPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: OTPPage(),
    );
  }
}

