import 'package:connectify/authentication/forgotPass/controllers/reset_password_controller.dart';
import 'package:connectify/authentication/forgotPass/provider/reset_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utils/contants/colors/app_colors.dart';
import '../../../signup/controllers/validations.dart';
import '../../models/forgot_pass_model.dart';

class ResetPasswordPage extends StatefulWidget {
  final String? email;
  const ResetPasswordPage({super.key, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resetPassProvider = Provider.of<ResetPasswordProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.contain,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*0.2,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reset", style: TextStyle(fontSize: size.width*0.12),),
                        Text("Password", style: TextStyle(fontSize: size.width*0.12),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.02),
                    child: Form(
                      key: resetPassProvider.formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextFormField(
                                style: TextStyle(color: AppColors.textColor),
                                onChanged: (value) => resetPassProvider.setPassword(value),
                                decoration: InputDecoration(
                                  errorText: (resetPassProvider.passwordError == '')? null : resetPassProvider.passwordError,
                                  labelText: 'New Password',
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
                                validator: (value) => Validator.isValidPassword(value!),
                              ),
                              SizedBox(height: size.height*0.03,),
                              TextFormField(
                                style: TextStyle(color: AppColors.textColor),
                                onChanged: (value) => resetPassProvider.setConfirmPassword(value),
                                decoration: InputDecoration(
                                  errorText: (resetPassProvider.confirmError == '')? null : resetPassProvider.confirmError,
                                  labelText: 'Confirm New Password',
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
                                validator: (value) => Validator.isValidConfirm(value!, resetPassProvider.password),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: size.height*0.25,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                    child: Container(
                      height: size.height*0.06,
                      width: size.width*0.9,
                      child: ElevatedButton(
                          onPressed: () async{
                            if(resetPassProvider.formKey.currentState!.validate()) {
                              ForgotPassModel? res = await performReset(widget.email.toString(), resetPassProvider.password);
                              if (res != null) {
                                resetPassProvider.validateReset(res.msg, context);
                              } else {
                                resetPassProvider.validateReset(
                                    "Something went wrong, Please try again later", context);
                              }
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
            ],
          ),
        ),
      ),
    );
  }
}
