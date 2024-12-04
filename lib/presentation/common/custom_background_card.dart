import 'package:challenge/app/constants.dart';
import 'package:challenge/presentation/res/color_manager.dart';
import 'package:challenge/presentation/res/font_manager.dart';
import 'package:challenge/presentation/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.backgroundWidget,
      this.width,
      this.onTap
      });
  String title;
  String subTitle;
  Widget backgroundWidget;
  double? width;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 120.h,
          width: width,
          decoration: BoxDecoration(
            color: ColorManager.darkGrey,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -15.h,
                right: -15.w,
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p8.sp),
                  child: backgroundWidget,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppPadding.p14.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.medium),
                    ),
                    Gap(5.h),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorManager.grey1,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
