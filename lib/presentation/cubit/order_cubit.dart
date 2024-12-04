import 'package:bloc/bloc.dart';
import 'package:challenge/app/constants.dart';
import 'package:challenge/presentation/cubit/order_states.dart';
import '../../domain/entities/order.dart';
import '../../domain/usecases/order_metrics_usecase.dart';

class OrderMetricsCubit extends Cubit<OrderMetricsState> {
  final OrderMetricsUseCase orderMetricsUseCase;

  OrderMetricsCubit(this.orderMetricsUseCase)
      : super(const OrderMetricsState());

  void calculateMetrics(List<Order> orders) {
    final total = orderMetricsUseCase.getTotalCount(orders);
    final avgPrice = orderMetricsUseCase.getAveragePrice(orders);
    final totalPriceSum = orderMetricsUseCase.getTotalPriceSum(orders);

    final deliveredCount =
        orderMetricsUseCase.getCountByStatus(orders, Constants.delivered);
    final orderedCount =
        orderMetricsUseCase.getCountByStatus(orders, Constants.ordered);
    final returnedCount =
        orderMetricsUseCase.getCountByStatus(orders, Constants.returned);

    emit(OrderMetricsState(
      total: total,
      avgPrice: avgPrice,
      deliveredCount: deliveredCount,
      returnedCount: returnedCount,
      orderedCount: orderedCount,
      totalPriceSum: totalPriceSum,
    ));
  }

  void calculateDeliveredOrders(List<Order> orders) {
    final deliveredOrders =
        orderMetricsUseCase.filterByStatus(orders, Constants.delivered);
    emit(DeliveredOrdersState(deliveredOrders));
  }

  void calculateOrderedOrders(List<Order> orders) {
    final orderedOrders =
        orderMetricsUseCase.filterByStatus(orders, Constants.ordered);
    emit(OrderedOrdersState(orderedOrders));
  }

  void calculateReturnedOrders(List<Order> orders) {
    final returnedOrders =
        orderMetricsUseCase.filterByStatus(orders, Constants.returned);
    emit(ReturnedOrdersState(returnedOrders));
  }
}
