import 'package:challenge/app/constants.dart';
import 'package:challenge/presentation/res/color_manager.dart';
import 'package:challenge/presentation/res/font_manager.dart';
import 'package:challenge/presentation/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {super.key,
      required this.buyer,
      required this.time,
      required this.amount,
      required this.from});
  final String buyer;
  final DateTime time;
  final String amount;
  final String from;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p12.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: ColorManager.primary,
            child: CircleAvatar(
                radius: 18,
                backgroundColor: ColorManager.black,
                child: Image.asset(Constants.subLogo, height: 10.h)),
          ),
          Gap(10.w),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("$buyer",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primary,
                            fontSize: 18.sp,
                          )),
                  Gap(10.w),
                  Text("${time.day}/${time.month}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorManager.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeightManager.light)),
                ],
              ),
              Text("$amount",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeightManager.light)),
              Text(
                "from $from",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.grey1,
                    fontSize: 16.sp,
                    fontWeight: FontWeightManager.light),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
