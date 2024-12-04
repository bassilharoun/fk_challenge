import 'package:challenge/data/repositories/order_repository_impl.dart';
import 'package:challenge/domain/entities/order.dart';
import 'package:challenge/presentation/home/home_screen.dart';
import 'package:challenge/presentation/res/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Order> _orders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchOrders(); 
  }

  Future<void> _fetchOrders() async {
    final repository = OrderRepositoryImpl(); 
    try {
      final orders = await repository.fetchOrders(); 
      setState(() {
        _orders = orders; 
        _isLoading = false; 
      });
    } catch (e) {
      print('Error fetching orders: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FlapKap',
          theme: getApplicationTheme(),
          home: _isLoading
              ? const Center(child: CircularProgressIndicator()) 
              : HomeScreen(orders: _orders), 
        );
      },
    );
  }
}
