import 'package:connectify/authentication/login/models/login_user_model.dart';
import 'package:connectify/authentication/signup/controllers/otp_controller.dart';
import 'package:connectify/utils/contants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../../utils/routes/app_route_constants.dart';
import '../../models/signup_model.dart';
import '../../provider/otp_provider.dart';

class OTPPage extends StatefulWidget {
  final String? email;
  const OTPPage({super.key, required this.email});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final otpProvider = Provider.of<OtpProvider>(context);
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
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.05),
                    child: Image.asset("assets/images/progressBar3.png"),
                  ),
                  SizedBox(height: size.height*0.05,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.05),
                    child: Text("Verify yourself",
                      style: TextStyle(
                          fontSize: size.width*0.06
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.05, top: size.height*0.01),
                    child: Text("Beep-boop! Code dispatched."),
                  ),
                  SizedBox(height: size.height*0.05,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                    child: Form(
                      child: Pinput(
                        forceErrorState: otpProvider.error == ''? false: true,
                        errorText: otpProvider.error == ''? null : otpProvider.error,
                        onChanged: (otp) {
                          if(otp.length < 4) {
                            otpProvider.setOtp(otp, "Enter a Valid OTP");
                          }
                          else {
                            otpProvider.setOtp(otp, '');
                          }
                        },
                        defaultPinTheme: PinTheme(
                          textStyle: TextStyle(
                            fontSize: size.width*0.05,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          height: size.height * 0.08,
                          width: size.width * 0.18,
                        ),
                        length: 4,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.03),
                    child: TextButton(
                        onPressed: () {} ,
                        child: Text("Resend OTP",
                          style: TextStyle(color: AppColors.buttonColor),
                        )
                    ),
                  ),
                  SizedBox(height: size.height*0.15,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                    child: Container(
                      height: size.height*0.06,
                      width: size.width*0.9,
                      child: ElevatedButton(
                          onPressed: () async{
                            LoginUserModel? res = await verifyOTP(widget.email.toString(), otpProvider.otp);
                            if (res != null) {
                              otpProvider.validateAndSubmitOtp(res.msg, context);
                            } else {
                              otpProvider.validateAndSubmitOtp(
                                  "Invalid OTP", context);
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
