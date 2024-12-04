import 'package:challenge/presentation/res/color_manager.dart';
import 'package:challenge/presentation/res/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.width,
    required this.height,
  });
  String label;
  IconData prefixIcon;
  double width;
  double height;


  @override
  Widget build(BuildContext context) {
    return Container(
                        width: width,
                        height: height,
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.p8.sp),
                        decoration: BoxDecoration(
                          color: ColorManager.darkGrey,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          decoration: InputDecoration(
                            label: Text(label),
                            hintStyle: Theme.of(context).textTheme.bodyMedium,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              prefixIcon,
                              color: ColorManager.grey1,
                            ),
                          ),
                        ),
                      );
  }
}