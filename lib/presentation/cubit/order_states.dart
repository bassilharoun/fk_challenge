import 'package:challenge/domain/entities/order.dart';

class OrderMetricsState {
  final int total;
  final double avgPrice;
  final int deliveredCount;
  final int returnedCount;
  final int orderedCount;
  final double totalPriceSum;
  final List<Order> deliveredOrders;
  final List<Order> orderedOrders;
  final List<Order> returnedOrders;

  const OrderMetricsState({
    this.total = 0,
    this.avgPrice = 0.0,
    this.deliveredCount = 0,
    this.returnedCount = 0,
    this.orderedCount = 0,
    this.totalPriceSum = 0.0,
    this.deliveredOrders = const [],
    this.orderedOrders = const [],
    this.returnedOrders = const [],
  });
}

class DeliveredOrdersState extends OrderMetricsState {
  final List<Order> deliveredOrders;

  const DeliveredOrdersState(this.deliveredOrders) : super(deliveredOrders: deliveredOrders);
}

class OrderedOrdersState extends OrderMetricsState {
  final List<Order> orderedOrders;

  const OrderedOrdersState(this.orderedOrders) : super(orderedOrders: orderedOrders);
}

class ReturnedOrdersState extends OrderMetricsState {
  final List<Order> returnedOrders;

  const ReturnedOrdersState(this.returnedOrders) : super(returnedOrders: returnedOrders);
}
