import 'package:flutter/material.dart';

class Forgotbg extends StatelessWidget {
  final String first;
  final String second;
  const Forgotbg({super.key, required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/leftVector.png"),
            Image.asset("assets/images/rightVector.png",
              width: size.width*0.55,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(first, style: TextStyle(fontSize: size.width*0.12),),
              Text(second, style: TextStyle(fontSize: size.width*0.12),),
            ],
          ),
        ),
      ],
    );
  }
}
