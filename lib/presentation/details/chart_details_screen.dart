import 'package:challenge/domain/entities/order.dart';
import 'package:challenge/presentation/common/logo.dart';
import 'package:challenge/presentation/res/color_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartDetailsScreen extends StatelessWidget {
  ChartDetailsScreen({super.key, required this.orders});
  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    Map<String, int> orderCounts = {};
    for (var order in orders) {
      final date = order.registered
          .toIso8601String()
          .split('T')
          .first; 
      orderCounts[date] = (orderCounts[date] ?? 0) + 1;
    }

    final sortedDates = orderCounts.keys.toList()..sort();
    final spots = sortedDates.asMap().entries.map((entry) {
      int index = entry.key;
      String date = entry.value;
      return FlSpot(index.toDouble(), orderCounts[date]?.toDouble() ?? 0.0);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        backgroundColor: ColorManager.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: sortedDates.length * 40,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade800,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 5,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index < sortedDates.length && index % 5 == 0) {
                          return Text(
                            sortedDates[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey.shade800, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: ColorManager.primary,
                    belowBarData: BarAreaData(
                      show: true,
                      color: ColorManager.primary.withOpacity(0.3),
                    ),
                    dotData: FlDotData(show: false),
                    barWidth: 4,
                  ),
                ],
                minX: 0,
                maxX: sortedDates.length.toDouble() - 1,
                minY: 0,
                backgroundColor: ColorManager.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
