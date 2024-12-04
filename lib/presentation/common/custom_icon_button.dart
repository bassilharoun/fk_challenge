import 'package:challenge/presentation/res/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    super.key,
    required this.icon,
    this.iconSize = 20,
    this.circleRadius = 20,
    this.withTitle = false,
    this.title = '',
    this.onTap,
  });
  IconData icon;
  double iconSize;
  double circleRadius;
  bool withTitle;
  String title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: circleRadius.r,
            backgroundColor: ColorManager.darkGrey,
            child: Icon(
              icon,
              size: iconSize.sp,
              color: ColorManager.white,
            ),
          ),
          if (withTitle) ...[
            Gap(5.h),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ]
        ],
      ),
    );
  }
}
