import 'package:blue_eye_web/Core/Constants/Common%20Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class LineChart extends StatelessWidget {
  List<SalesData> data = [
    SalesData('Jan', 35),
    SalesData('Feb', 28),
    SalesData('Mar', 34),
    SalesData('Apr', 32),
    SalesData('May', 40),
    SalesData('June', 12),
    SalesData('July', 45),
    SalesData('Aug', 21),
    SalesData('Sep', 12),
    SalesData('Oct', 40),
    SalesData('Nov', 24),
    SalesData('Dec', 38),
  ];

  LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(
            text: 'Employee Monthly Requests',
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        legend: Legend(
          isVisible: true,
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
            dataSource: data,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.requests,
            width: 5,
            color: mainColor,
            name: 'Requests',
            // dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String month;
  final double requests;

  SalesData(this.month, this.requests);
}
