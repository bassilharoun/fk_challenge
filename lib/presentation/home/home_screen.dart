import 'package:challenge/app/constants.dart';
import 'package:challenge/domain/usecases/order_metrics_usecase.dart';
import 'package:challenge/presentation/common/background.dart';
import 'package:challenge/presentation/common/custom_background_card.dart';
import 'package:challenge/presentation/common/custom_icon_button.dart';
import 'package:challenge/presentation/common/custom_text_feild.dart';
import 'package:challenge/presentation/common/logo.dart';
import 'package:challenge/presentation/cubit/order_cubit.dart';
import 'package:challenge/presentation/cubit/order_states.dart';
import 'package:challenge/presentation/delivered/delivered_screen.dart';
import 'package:challenge/presentation/details/chart_details_screen.dart';
import 'package:challenge/presentation/ordered/ordered_screen.dart';
import 'package:challenge/presentation/res/color_manager.dart';
import 'package:challenge/presentation/res/values_manager.dart';
import 'package:challenge/presentation/returned/returned_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../domain/entities/order.dart';

class HomeScreen extends StatelessWidget {
  final List<Order> orders;

  const HomeScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          OrderMetricsCubit(OrderMetricsUseCase())..calculateMetrics(orders),
      child: Scaffold(
        body: Stack(
          children: [
            const Background(),
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: Gap(40.h)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p14.sp),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: ColorManager.darkGrey,
                          backgroundImage:
                              const AssetImage(Constants.profileImagePath),
                        ),
                        const Spacer(),
                        CustomTextFeild(
                            label: "Search",
                            prefixIcon: CupertinoIcons.search,
                            width: 200.w,
                            height: 40.h),
                        const Spacer(),
                        CustomIconButton(icon: CupertinoIcons.bell),
                        const Spacer(),
                        CustomIconButton(icon: Icons.settings_outlined),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: Gap(10.h)),
                SliverAppBar(
                  expandedHeight: 25.h,
                  backgroundColor: Colors.transparent,
                  floating: false,
                  pinned: true,
                  flexibleSpace: const FlexibleSpaceBar(
                    centerTitle: true,
                    expandedTitleScale: 1,
                    title: Logo(),
                  ),
                ),
                // Display dynamic data using BlocBuilder
                SliverToBoxAdapter(
                  child: BlocBuilder<OrderMetricsCubit, OrderMetricsState>(
                    builder: (context, state) {
                      return Center(
                        child: Text(
                          '\$${state.totalPriceSum.toStringAsFixed(2)}',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: AppSize.s40.sp,
                                  ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<OrderMetricsCubit, OrderMetricsState>(
                    builder: (context, state) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.p14.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Average price',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Gap(5.w),
                            Text(
                              '\$${state.avgPrice.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: ColorManager.success,
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(child: Gap(10.h)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p20.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          icon: CupertinoIcons.shopping_cart,
                          circleRadius: 25,
                          iconSize: 25,
                          title: 'Ordered',
                          withTitle: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<OrderMetricsCubit>(
                                      context)
                                    ..calculateOrderedOrders(orders),
                                  child: OrderedScreen(),
                                ),
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        CustomIconButton(
                          icon: Icons.pedal_bike,
                          circleRadius: 25,
                          iconSize: 25,
                          title: 'Delivered',
                          withTitle: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<OrderMetricsCubit>(
                                      context)
                                    ..calculateDeliveredOrders(orders),
                                  child: DeliveredScreen(),
                                ),
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        CustomIconButton(
                          icon: CupertinoIcons.return_icon,
                          circleRadius: 25,
                          iconSize: 25,
                          title: 'Returned',
                          withTitle: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<OrderMetricsCubit>(
                                      context)
                                    ..calculateReturnedOrders(orders),
                                  child: ReturnedScreen(),
                                ),
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        CustomIconButton(
                          icon: CupertinoIcons.doc,
                          circleRadius: 25,
                          iconSize: 25,
                          title: 'History',
                          withTitle: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.all(AppPadding.p14.sp),
                  child: Column(
                    children: [
                      CustomCard(
                          title: 'Balance',
                          subTitle: 'Total balance that you have',
                          width: double.infinity,
                          backgroundWidget: Image.asset(
                            Constants.bitcoinImagePath,
                            height: 110.h,
                          )),
                      Gap(10.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomCard(
                              title: 'Chart',
                              subTitle: '',
                              backgroundWidget: Image.asset(
                                Constants.chartImagePath,
                                height: 100.h,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChartDetailsScreen(
                                                orders: orders)));
                              },
                            ),
                          ),
                          Gap(10.w),
                          Expanded(
                            child: CustomCard(
                                title: 'Calculate',
                                subTitle: '',
                                backgroundWidget: Image.asset(
                                  Constants.calcImagePath,
                                  height: 100.h,
                                )),
                          ),
                        ],
                      ),
                      Gap(10.h),
                      CustomCard(
                          title: 'Balance',
                          subTitle: 'Total balance that you have',
                          width: double.infinity,
                          backgroundWidget: Image.asset(
                            Constants.bitcoinImagePath,
                            height: 110.h,
                          )),
                    ],
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
