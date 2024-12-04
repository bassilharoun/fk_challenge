import 'package:challenge/app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
                    Constants.logoImagePath,
                    height: 25.h,
                  );
  }
}