import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SparklineChart extends StatelessWidget {
  final List<double> data;

  const SparklineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: data.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value);
            }).toList(),
            isCurved: true,
            color: Colors.green,
            barWidth: 2,
            belowBarData: BarAreaData(show: false),
            dotData: FlDotData(show: false),
          ),
        ],
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
      ),
    );
  }
}
