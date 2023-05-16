import 'package:blue_eye_web/Core/Constants/Common%20Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart2 extends StatelessWidget {
  BarChart2({Key? key}) : super(key: key);

  final List<BarChartData> chartData = [
    BarChartData('Accepted', 12),
    BarChartData('Rejected', 18),
    BarChartData('Pending', 23),
    BarChartData('Training', 30),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(
          text: 'Employee Details',
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          )),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        header: '',
      ),
      series: <ChartSeries<dynamic, dynamic>>[
        StackedColumnSeries<BarChartData, String>(
          dataSource: chartData,
          xValueMapper: (BarChartData ch, _) => ch.status,
          yValueMapper: (BarChartData ch, _) => ch.employee,
          color: mainColor,
          width: 0.1.w,
        ),
      ],
    );
  }
}

class BarChartData {
  final String status;
  final int employee;

  BarChartData(this.status, this.employee);
}
