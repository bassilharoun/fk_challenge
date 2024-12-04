import 'package:challenge/app/app.dart';
import 'package:challenge/domain/usecases/order_metrics_usecase.dart';
import 'package:challenge/presentation/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => OrderMetricsCubit(OrderMetricsUseCase()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

