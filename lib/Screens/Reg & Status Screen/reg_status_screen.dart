import 'package:blue_eye_web/Core/Utils/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Core/Constants/Common Colors/colors.dart';
import '../../Core/Provider/model_provider.dart';
import '../../Core/Utils/hover.dart';

class RegStatusScreen extends StatefulWidget {
  const RegStatusScreen({super.key});

  @override
  State<RegStatusScreen> createState() => _RegStatusScreenState();
}

class _RegStatusScreenState extends State<RegStatusScreen> {
  static final data = ['Accept', 'Reject', 'Under Process', 'Under Training'];
  final ScrollController _controllerOne = ScrollController();
  final ScrollController _controllerTwo = ScrollController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserTableModel>(context, listen: false);

    return Scaffold(
        appBar: PreferredSize(
          child: AppbarWidget(screeName: "Reg/Status"),
          preferredSize: Size.fromHeight(50.h),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 30),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       "",
                //       style:
                //           TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                //     ),
                //   ),
                // ),

                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    // width: MediaQuery.of(context).size.width * (1 / .7),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      // width: 1,
                    )),
                    child: Scrollbar(
                      thumbVisibility: true,
                      controller: _controllerOne,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _controllerOne,
                        child: Scrollbar(
                          controller: _controllerTwo,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _controllerTwo,
                            child: DataTable(
                              checkboxHorizontalMargin: 10.sp,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey),
                                color: Colors.white,
                              ),
                              columns: const [
                                DataColumn(label: Text('Id')),
                                DataColumn(label: Text('Name')),
                                DataColumn(label: Text('Age')),
                                DataColumn(label: Text('Nationality')),
                                DataColumn(label: Text('Mobile Number')),
                                DataColumn(label: Text('Country')),
                                DataColumn(label: Text('City')),
                                DataColumn(label: Text('Status')),
                                DataColumn(label: Text('Action')),
                              ],
                              rows: provider.users
                                  .map(
                                    (user) => DataRow(cells: [
                                      DataCell(Text(user.id)),
                                      DataCell(Text(user.name)),
                                      DataCell(Text(user.age)),
                                      DataCell(Text(user.nationality)),
                                      DataCell(Text(user.mobileNo)),
                                      DataCell(Text(user.country)),
                                      DataCell(Text(user.city)),
                                      DataCell(Consumer<UserTableModel>(
                                        builder: (context, value, child) {
                                          return Container(
                                            height: 40.h,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: grey,
                                            ),
                                            child: DropdownButton<String>(
                                              itemHeight: 50.h,
                                              focusColor: Colors.transparent,
                                              value: user.status,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: data.map((String items) {
                                                return DropdownMenuItem(
                                                    value: items,
                                                    child: OnHover(
                                                      builder: (isHovered) {
                                                        final color = isHovered
                                                            ? Colors.blue
                                                            : Colors.black;
                                                        return Row(
                                                          children: [
                                                            Text(
                                                              items,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: color),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ));
                                              }).toList(),
                                              onChanged: (String? newvalue) {
                                                value.updateUserStatus(
                                                    user, newvalue!);
                                              },
                                            ),
                                          );
                                        },
                                      )),
                                      DataCell(Consumer<UserTableModel>(
                                          builder: (context, value, child) {
                                        return MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          onHover: (PointerHoverEvent event) {
                                            value.updateHover(user, true);
                                          },
                                          onExit: (PointerExitEvent event) {
                                            value.updateHover(user, false);
                                          },
                                          child: Container(
                                            height: 35.sp,
                                            width: 35.sp,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              border: Border.all(
                                                  color: Colors.red,
                                                  width: 1.sp),
                                              color: user.action
                                                  ? Colors.white
                                                  : Colors.red,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.delete,
                                                color: user.action
                                                    ? Colors.red
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      }))
                                    ]),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
