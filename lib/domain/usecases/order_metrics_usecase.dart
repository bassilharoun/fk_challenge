import '../entities/order.dart';

class OrderMetricsUseCase {
  int getTotalCount(List<Order> orders) {
    return orders.length;
  }

    double getTotalPriceSum(List<Order> orders) {
    return orders.fold(0.0, (sum, order) {
      final price = order.price.replaceAll(RegExp(r'[^\d.]'), '');
      return sum + double.parse(price);
    });
  }


  double getAveragePrice(List<Order> orders) {
    final prices = orders.map((order) {
      final price = order.price.replaceAll(RegExp(r'[^\d.]'), '');
      return double.parse(price);
    }).toList();

    return prices.isEmpty ? 0 : prices.reduce((a, b) => a + b) / prices.length;
  }

  int getCountByStatus(List<Order> orders, String status) {
    return orders.where((order) => order.status == status).length;
  }

  List<Order> filterByStatus(List<Order> orders, String status) {
    return orders.where((order) => order.status == status).toList();
  }
}
