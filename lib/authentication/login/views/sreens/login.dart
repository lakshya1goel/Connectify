import 'package:connectify/authentication/login/controllers/login_controller.dart';
import 'package:connectify/utils/contants/colors/app_colors.dart';
import 'package:connectify/utils/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../models/login_user_model.dart';
import '../../provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMsg = "";
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/leftVector.png"),
                  Image.asset("assets/images/rightVector.png",
                    width: size.width*0.6,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Text("Login", style: TextStyle(fontSize: size.width*0.12),),
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
                            controller: email_controller,
                            onChanged: (value) => loginProvider.setEmail(value),
                            decoration: InputDecoration(
                              errorText: (loginProvider.emailError == '')? null : loginProvider.emailError,
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
                            onChanged: (value) => loginProvider.setPassword(value),
                            decoration: InputDecoration(
                              errorText: (loginProvider.passwordError == '')? null : loginProvider.passwordError,
                                labelText: 'Password',
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
              Padding(
                padding: EdgeInsets.only(right: size.width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).pushNamed(MyAppRouteConstants.ForgotPasswordRouteName);
                        },
                        child: Text("Forgot Password?",
                        style: TextStyle(
                          color: AppColors.buttonColor
                        ),)
                    ),
                  ],
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
                        LoginUserModel? res = await performLogin(email_controller.text.toString(), pass_controller.text.toString());
                        if (res != null) {
                          loginProvider.validateLogin(res.msg, context);

                        } else {
                          loginProvider.validateLogin("Invalid Credentials!", context);
                        }
                      },
                      child: Text("Login"),
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
                  Text("Don’t have an account?"),
                  TextButton(
                      onPressed: () {
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.SignupRouteName);
                      } ,
                      child: Text("Signup",
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
