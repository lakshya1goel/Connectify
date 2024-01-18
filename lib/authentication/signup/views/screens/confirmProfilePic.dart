import 'package:connectify/authentication/signup/provider/avatar_selection_provider.dart';
import 'package:connectify/utils/contants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../login/provider/loading_provider.dart';
import '../../controllers/validations.dart';

class ConfirmProfilePic extends StatefulWidget {
  final String? email;
  const ConfirmProfilePic({super.key, required this.email});

  @override
  State<ConfirmProfilePic> createState() => _ConfirmProfilePicState();
}

class _ConfirmProfilePicState extends State<ConfirmProfilePic> {
  Future<void> _pickImage(ImageSource s) async {
    final pickedImage = await ImagePicker().pickImage(source: s);
    if (pickedImage != null) {
      print("File not Picked yet");
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final avatarProvider = Provider.of<AvatarProvider>(context);
    final loadingProvider = Provider.of<LoadingProvider>(context);
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
                  SizedBox(height: size.height*0.15,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                    child: Text("Sign up", style: TextStyle(fontSize: size.width*0.12),),
                  ),
                  SizedBox(height: size.height*0.05,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.05),
                    child: Image.asset("assets/images/progressBar2.png"),
                  ),
                  SizedBox(height: size.height*0.05,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.05),
                    child: Text("Pick a Pic!",
                      style: TextStyle(
                          fontSize: size.width*0.06
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.05),
                    child: Row(
                      children: [
                        Image.asset("assets/images/cameraIcon.png"),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.buttonColor,
                                    title: Text("Pick an Image"),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          await _pickImage(ImageSource.camera);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Capture from Camera"),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await _pickImage(ImageSource.gallery);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Pick from Gallery"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Cancel"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text("Add yours",
                              style: TextStyle(
                                color: AppColors.buttonColor,
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.05),
                    child: Text("Pick a username",
                      style: TextStyle(
                          fontSize: size.width*0.06
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                    child: Form(
                      key: avatarProvider.formKey,
                      child: TextFormField(
                        style: TextStyle(color: AppColors.textColor),
                        onChanged: (value) => avatarProvider.setUserName(value),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          errorText: (avatarProvider.userIdError == '')? null : avatarProvider.userIdError,
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
                        validator: (value) => Validator.isValidUserId(value!),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.08,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                    child: Container(
                      height: size.height*0.06,
                      width: size.width*0.9,
                      child: ElevatedButton(
                          onPressed: () async{
                            // print(selectedAvatar);
                            // print(avatarProvider.userId);
                            // print(widget.email.toString());
                            // if (avatarProvider.formKey.currentState!.validate()) {
                            //   loadingProvider.setLoading(true);
                            //   loadingProvider.showCustomLoadingDialog(context);
                            //   print(avatarProvider.userId);
                            //   print(widget.email.toString());
                            //   SignUpModel? res = await uploadAvatar(widget.email.toString(), avatarProvider.userId, selectedAvatar);
                            //   loadingProvider.setLoading(false);
                            //   loadingProvider.hideCustomLoadingDialog(context);
                            //   if (res != null) {
                            //     avatarProvider.validateUser(res.msg, context, widget.email.toString());
                            //   } else {
                            //     avatarProvider.validateUser(
                            //         "An error occured, Please try again later", context, widget.email.toString());
                            //   }
                            // }
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

