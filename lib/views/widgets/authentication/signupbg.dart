import 'package:flutter/material.dart';

class Signupbg extends StatelessWidget {
  const Signupbg({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/leftVector.png"),
            SizedBox(height: size.height*0.06,),
            Padding(
              padding: EdgeInsets.only(left: size.width*0.05),
              child: Text("Sign up", style: TextStyle(fontSize: size.width*0.12),),
            ),
          ],
        ),
        Image.asset("assets/images/rightVector.png",
          width: size.width*0.55,
        ),
      ],
    );
  }
}
