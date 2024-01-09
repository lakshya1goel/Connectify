import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectify/utils/contants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/routes/app_route_constants.dart';

class ProfilePicSelectionPage extends StatefulWidget {
  const ProfilePicSelectionPage({super.key});

  @override
  State<ProfilePicSelectionPage> createState() => _ProfilePicSelectionPageState();
}

class _ProfilePicSelectionPageState extends State<ProfilePicSelectionPage> {
  Future<void> _pickImage(ImageSource s) async {
    final pickedImage = await ImagePicker().pickImage(source: s);
    if (pickedImage != null) {
      print("File not Picked yet");
    }
  }
  String selectedAvatar = "";
  int currentCarouselIndex = 0;
  List<String> avatarUrls = [
    "https://connectifystorage.s3.ap-south-1.amazonaws.com/resources/avatars/None.png",
    "https://connectifystorage.s3.ap-south-1.amazonaws.com/resources/avatars/avatar+1.png",
    "https://connectifystorage.s3.ap-south-1.amazonaws.com/resources/avatars/avatar+2.png",
    "https://connectifystorage.s3.ap-south-1.amazonaws.com/resources/avatars/avatar+3.png",
    "https://connectifystorage.s3.ap-south-1.amazonaws.com/resources/avatars/avatar+4.png",
    "https://connectifystorage.s3.ap-south-1.amazonaws.com/resources/avatars/avatar+5.png",
    "https://connectifystorage.s3.ap-south-1.amazonaws.com/resources/avatars/avatar+6.png",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    child: Image.asset("assets/images/progressBar3.png"),
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
                  Container(
                    height: size.height*0.16,
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentCarouselIndex = index;
                          });
                        },
                        viewportFraction: 0.28,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                      ),
                      items: avatarUrls.map((String url) {
                        return Container(
                          width: currentCarouselIndex == avatarUrls.indexOf(url) ? size.width * 0.3 : size.width * 0.2,
                          height: currentCarouselIndex == avatarUrls.indexOf(url) ? size.width * 0.3 : size.width * 0.2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: currentCarouselIndex == avatarUrls.indexOf(url)
                                ? Border.all(width: 4.0, color: AppColors.buttonColor)
                                : null,
                          ),
                          child: CircleAvatar(
                            child: Image.network(url),
                          ),
                        );
                      }).toList(),
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
                                    title: Text("Pick an Image"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Cancel"),
                                      ),
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
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
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
                    ),
                  ),
                  SizedBox(height: size.height*0.08,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                    child: Container(
                      height: size.height*0.06,
                      width: size.width*0.9,
                      child: ElevatedButton(
                          onPressed: () {
                            context.goNamed(MyAppRouteConstants.LoginRouteName);
                          },
                          child: Text("Finish"),
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

