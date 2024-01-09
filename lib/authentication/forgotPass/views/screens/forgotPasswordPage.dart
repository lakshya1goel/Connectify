import 'package:connectify/authentication/forgotPass/views/controllers/forgot_pass_controller.dart';
import 'package:connectify/authentication/forgotPass/views/models/forgot_pass_model.dart';
import 'package:connectify/authentication/forgotPass/views/provider/forgot_pass_provider.dart';
import 'package:connectify/authentication/forgotPass/views/widgets/forgotbg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utils/contants/colors/app_colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final forgotPassProvider = Provider.of<ForgotPassProvider>(context);
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
                            style: TextStyle(color: AppColors.textColor),
                            onChanged: (value) => forgotPassProvider.setEmail(value),
                            decoration: InputDecoration(
                              errorText: (forgotPassProvider.emailError == '')? null : forgotPassProvider.emailError,
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
                      onPressed: () async{
                        if(forgotPassProvider.email.isNotEmpty) {
                          ForgotPassModel? res = await sendOTP(
                              forgotPassProvider.email);
                          if (res != null) {
                            forgotPassProvider.validateEmail(res.msg, context);
                          } else {
                            forgotPassProvider.validateEmail("Invalid Email", context);
                          }
                        } else {
                          forgotPassProvider.validateEmail("Email Cannot be Empty!", context);
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
            ],
          ),
        ),
      ),
    );
  }
}
