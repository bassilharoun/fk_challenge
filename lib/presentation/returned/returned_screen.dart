import 'package:challenge/presentation/common/custom_icon_button.dart';
import 'package:challenge/presentation/common/custom_text_feild.dart';
import 'package:challenge/presentation/common/logo.dart';
import 'package:challenge/presentation/common/order_item.dart';
import 'package:challenge/presentation/cubit/order_cubit.dart';
import 'package:challenge/presentation/cubit/order_states.dart';
import 'package:challenge/presentation/res/color_manager.dart';
import 'package:challenge/presentation/res/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ReturnedScreen extends StatelessWidget {
  const ReturnedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Logo(),
        ),
        body: BlocBuilder<OrderMetricsCubit, OrderMetricsState>(
          builder: (context, state) {
            if (state is ReturnedOrdersState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20.h),
                    Row(
                      children: [
                        CustomIconButton(
                          icon: CupertinoIcons.home,
                        ),
                        Gap(10.w),
                        Expanded(
                          child: CustomTextFeild(
                              label: "Search",
                              prefixIcon: CupertinoIcons.search,
                              width: double.infinity,
                              height: 40.h),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    Text(
                      "Returned ${state.returnedOrders.length}",
                      style: Theme.of(context).textTheme.titleLarge!,
                    ),
                    Gap(10.h),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.darkGrey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            topRight: Radius.circular(25.r),
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: state.returnedOrders.length,
                          itemBuilder: (context, index) {
                            return OrderItem(
                                buyer: state.returnedOrders[index].buyer,
                                time: state.returnedOrders[index].registered,
                                amount: state.returnedOrders[index].price
                                    .toString(),
                                from: state.returnedOrders[index].company);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }
}