import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Center(
          child: SpinKitThreeBounce(
            size: 50.0,
            itemBuilder: (_, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: index.isEven? Color(0xFFF0584F) : Color(0xFFEA63B9)
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

