import 'package:connectify/utils/contants/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/authentication/signupbg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Signupbg(),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.05),
                child: Image.asset("assets/images/progressBar.png"),
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
                              labelText: 'Full Name',
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
                          SizedBox(height: size.height*0.03,),
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
                          SizedBox(height: size.height*0.03,),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Create Password',
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
                          SizedBox(height: size.height*0.03,),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
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
              SizedBox(height: size.height*0.05,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Container(
                  height: size.height*0.06,
                  width: size.width*0.9,
                  child: ElevatedButton(
                      onPressed: () {},
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
              SizedBox(height: size.height*0.03,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Container(
                  height: size.height*0.06,
                  width: size.width*0.9,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/googleLogo.png"),
                          Text("  Signin with Google"),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.textColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: AppColors.textColor, width: 2.0),
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {} ,
                      child: Text("Next",
                        style: TextStyle(color: AppColors.buttonColor),
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
