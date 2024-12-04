import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/entities/order.dart';
import '../models/order_model.dart';

abstract class OrderRepository {
  Future<List<Order>> fetchOrders();
}

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<List<Order>> fetchOrders() async {
    final String response = await rootBundle.loadString('assets/json/orders.json');
    final List<dynamic> data = jsonDecode(response);

    return data.map((json) => OrderModel.fromJson(json).toEntity()).toList();
  }
}

extension OrderModelMapper on OrderModel {
  Order toEntity() {
    return Order(
      id: id,
      isActive: isActive,
      price: price,
      company: company,
      picture: picture,
      buyer: buyer,
      tags: tags,
      status: status,
      registered: registered,
    );
  }
}
