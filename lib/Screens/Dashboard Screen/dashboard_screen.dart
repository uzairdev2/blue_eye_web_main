import 'package:blue_eye_web/Core/Constants/Common%20Colors/colors.dart';
import 'package:blue_eye_web/Screens/Dashboard%20Screen/Charts/bar_chart.dart';
import 'package:blue_eye_web/Screens/Dashboard%20Screen/Charts/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Constants/Common SizedBox/costum_widgets.dart';
import '../../Core/Date Range Picker/date_range_picker.dart';
import '../../Core/Utils/Sizer.dart';
import 'Charts/pie_chart.dart';
import 'Common Widgets/costum_container.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isDesktop
          ? AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              centerTitle: true,
              title: const Text(
                'Welcome, Admin',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          : null,
      body: SingleChildScrollView(
        child: isMobile
            ? Padding(
                padding: EdgeInsets.all(15.0.sp),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            fixheight2,
                            Row(
                              children: [
                                const Icon(Icons.graphic_eq),
                                fixwidth2,
                                const Text('Dashboard Order Statistic'),
                              ],
                            ),
                            fixheight,
                            SizedBox(
                              height: 40.h,
                              width: 270.w,
                              child: DateRangePicker(),
                            ),
                            fixheight,
                            CostumContainer(
                              title: 'Violations',
                              icon: Icons.warning_rounded,
                              text: '233',
                              color: firstCard,
                            ),
                            fixheight,
                            CostumContainer(
                              title: 'Paid Salary',
                              icon: Icons.attach_money,
                              text: '482',
                              color: mainColor,
                            ),
                            fixheight,
                            CostumContainer(
                              title: 'Remaining Salaries',
                              icon: Icons.money_off_csred_rounded,
                              text: '163',
                              color: secondCard,
                            ),
                            fixheight,
                            CostumContainer(
                              title: 'Total Registered Employees',
                              icon: Icons.perm_contact_calendar_outlined,
                              text: '233',
                              color: thirdCard,
                            ),
                            fixheight,
                            CostumContainer(
                              title: 'Average Price of employee',
                              icon: Icons.bar_chart_rounded,
                              text: '233',
                              color: lastCard,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 330.h,
                      width: double.infinity,
                      child: Card(
                        child: BarChart2(),
                      ),
                    ),
                    fixwidth2,
                    SizedBox(
                      height: isMobile ? 350.h : 330.h,
                      width: double.infinity,
                      child: Card(
                        child: PieChartSample2(),
                      ),
                    ),
                    fixheight,
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: LineChart(),
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            fixheight2,
                            Row(
                              children: [
                                const Icon(Icons.graphic_eq),
                                fixwidth2,
                                const Text('Dashboard Order Statistic'),
                              ],
                            ),
                            fixheight,
                            const SizedBox(
                              height: 40,
                              width: 270,
                              child: DateRangePicker(),
                            ),
                            fixheight,
                            Row(
                              children: [
                                Expanded(
                                  child: CostumContainer(
                                    title: 'Violations',
                                    icon: Icons.warning_rounded,
                                    text: '233',
                                    color: firstCard,
                                  ),
                                ),
                                fixwidth1,
                                Expanded(
                                  child: CostumContainer(
                                    title: 'Paid Salary',
                                    icon: Icons.attach_money,
                                    text: '482',
                                    color: mainColor,
                                  ),
                                ),
                                fixwidth1,
                                Expanded(
                                  child: CostumContainer(
                                    title: 'Remaining Salaries',
                                    icon: Icons.money_off_csred_rounded,
                                    text: '163',
                                    color: secondCard,
                                  ),
                                ),
                              ],
                            ),
                            fixheight,
                            Row(
                              children: [
                                Expanded(
                                  child: CostumContainer(
                                    title: 'Remaining Salaries',
                                    icon: Icons.money_off_csred_rounded,
                                    text: '163',
                                    color: secondCard,
                                  ),
                                ),
                                fixwidth1,
                                Expanded(
                                  child: CostumContainer(
                                    title: 'Total Registered Employees',
                                    icon: Icons.perm_contact_calendar_outlined,
                                    text: '233',
                                    color: thirdCard,
                                  ),
                                ),
                                fixwidth1,
                                Expanded(
                                  child: CostumContainer(
                                    title: 'Average Price of employee',
                                    icon: Icons.bar_chart_rounded,
                                    text: '233',
                                    color: lastCard,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        // SizedBox(
                        //   height: 350,
                        //   width: 460,
                        //   child: Card(
                        //     child: BarChart2(),
                        //   ),
                        // ),
                        Expanded(
                          child: SizedBox(
                            height: 550,
                            child: Card(
                              child: BarChart2(),
                            ),
                          ),
                        ),
                        fixwidth2,
                        Expanded(
                          child: SizedBox(
                            height: 550,
                            child: Card(
                              child: PieChartSample2(),
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 350,
                        //   width: 460,
                        //   child: Card(
                        //     child: PieChartSample2(),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: LineChart(),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
