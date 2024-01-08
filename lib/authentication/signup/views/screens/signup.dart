import 'package:connectify/authentication/signup/models/signup_model.dart';
import 'package:connectify/authentication/signup/provider/signup_provider.dart';
import 'package:connectify/utils/contants/colors/app_colors.dart';
import 'package:connectify/authentication/login/views/sreens/login.dart';
import 'package:connectify/authentication/signup/views/screens/otpPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../utils/routes/app_route_constants.dart';
import '../../controllers/signup_controller.dart';
import '../widgets/signupbg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController confirm_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signupProvider = Provider.of<SignupProvider>(context);
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
                            style: TextStyle(color: AppColors.textColor),
                            controller: name_controller,
                            onChanged: (value) => signupProvider.setName(value),
                            decoration: InputDecoration(
                              errorText: (signupProvider.nameError == '')? null : signupProvider.nameError,
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
                            style: TextStyle(color: AppColors.textColor),
                            controller: email_controller,
                            onChanged: (value) => signupProvider.setEmail(value),
                            decoration: InputDecoration(
                              errorText: (signupProvider.emailError == '')? null : signupProvider.emailError,
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
                            style: TextStyle(color: AppColors.textColor),
                            controller: pass_controller,
                            onChanged: (value) => signupProvider.setPassword(value),
                            decoration: InputDecoration(
                              errorText: (signupProvider.passwordError == '')? null : signupProvider.passwordError,
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
                            style: TextStyle(color: AppColors.textColor),
                            controller: confirm_controller,
                            onChanged: (value) => signupProvider.setConfirm(value),
                            decoration: InputDecoration(
                              errorText: (signupProvider.confirmError == '')? null : signupProvider.confirmError,
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
                      onPressed: () async{
                        SignUpModel? res = await performRegisteration(name_controller.text.toString(), email_controller.text.toString(), pass_controller.text.toString());
                        if (res != null) {
                          signupProvider.validateSignup(res.msg, context);

                        } else {
                          signupProvider.validateSignup("User already exists!", context);
                        }
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
                      onPressed: () {
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.LoginRouteName);
                      } ,
                      child: Text("Signin",
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
