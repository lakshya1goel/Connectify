import 'package:connectify/views/widgets/authentication/forgotbg.dart';
import 'package:connectify/views/widgets/authentication/signupbg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/contants/colors/app_colors.dart';
import '../../../utils/routes/app_route_constants.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Forgotbg(first: "Forgot", second: "Password?",),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.02),
                child: Text("Enter you registered email"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.02),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: AppColors.textColor),
                              contentPadding: EdgeInsets.only(bottom: size.height*0.01),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.buttonColor,
                                  width: size.height*0.003,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.underlineColor,
                                  width: size.height*0.003,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
              SizedBox(height: size.height*0.2,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Container(
                  height: size.height*0.06,
                  width: size.width*0.9,
                  child: ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.OTPVerificationRouteName);
                      },
                      child: Text("Next"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.buttonColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
