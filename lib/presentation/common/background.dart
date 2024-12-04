import 'package:challenge/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Constants.backgroundImagePath,
        ),
        Center(
          child: Container(
            height: double.infinity,
            width: 250.w,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 20,
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 20,
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
