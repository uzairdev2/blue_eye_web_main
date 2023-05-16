import 'package:blue_eye_web/Screens/Routes%20Screen/model.dart';
import 'package:blue_eye_web/Screens/Routes%20Screen/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Core/Constants/Common Colors/colors.dart';
import '../../Core/Utils/Appbar.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(screeName: "Routes"),
        preferredSize: Size.fromHeight(50.h),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Consumer<RoutesProvider>(
              builder: (context, routesProvider, child) {
                return Container(
                  padding: width <= 450
                      ? const EdgeInsets.only(left: 50)
                      : width <= 1050
                          ? const EdgeInsets.only(left: 70)
                          : const EdgeInsets.only(left: 130),
                  child: DropdownButtonHideUnderline(
                    child: MyCustomDropDown(
                      value: routesProvider.selectedCity,
                      onChanged: (city) {
                        routesProvider.setSelectedCity(city!);
                      },
                      items: routeDataModelList.first.keys
                          .map<DropdownMenuItem<String>>(
                            (city) => DropdownMenuItem<String>(
                              value: city,
                              child: Text(city,
                                  style: const TextStyle(color: white)),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: Consumer<RoutesProvider>(
                builder: (context, routesProvider, child) {
                  return Table(
                    defaultColumnWidth: const FractionColumnWidth(0.2),
                    border: TableBorder.symmetric(
                      outside:
                          BorderSide(width: 1, color: Colors.grey.shade300),
                      inside: BorderSide(width: 1, color: Colors.grey.shade300),
                    ),
                    columnWidths: const {
                      0: FractionColumnWidth(0.2),
                      1: FractionColumnWidth(0.3),
                      2: FractionColumnWidth(0.25),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.5),
                        ),
                        children: const [
                          TableCell(
                            child: SizedBox(
                              height: 50,
                              child: Center(
                                child: Text('Routes'),
                              ),
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              height: 50,
                              child: Center(
                                child: Text('Status'),
                              ),
                            ),
                          ),
                          TableCell(
                            child: SizedBox(
                              height: 50,
                              child: Center(
                                child: Text('Action'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...routesProvider.filteredRoutes
                          .asMap()
                          .map(
                            (index, route) {
                              final isHover = routesProvider.isHovered(index);
                              return MapEntry(
                                index,
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: isHover
                                        ? Colors.grey.shade300
                                        : Colors.white,
                                  ),
                                  children: [
                                    TableCell(
                                        child: SizedBox(
                                            height: 50,
                                            child: Center(
                                                child: Text(route.route)))),
                                    TableCell(
                                        child: SizedBox(
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          route.status,
                                          style: TextStyle(
                                            color: route.status == 'Available'
                                                ? Colors.green
                                                : Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                    )),
                                    TableCell(
                                      child: MouseRegion(
                                        onHover: (event) {
                                          routesProvider.setHover(index, true);
                                        },
                                        onExit: (event) {
                                          routesProvider.setHover(index, false);
                                        },
                                        child: ActionButton(
                                          onTap: () {
                                            customDialog(
                                              context,
                                              title: 'Update Status',
                                              message:
                                                  'Are You Sure you want to Update Status?',
                                              onTapYes: () {
                                                routesProvider
                                                    .updateStatus(index);
                                                Navigator.pop(context);
                                              },
                                            );
                                          },
                                          btnColor: isHover
                                              ? Colors.white
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                          iconColor: isHover
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                              : Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                          .values
                          .toList()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> customDialog(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onTapYes,
  }) {
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel❌')),
              TextButton(
                onPressed: onTapYes,
                child: const Text('Yes✅'),
              ),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class MyCustomDropDown extends StatelessWidget {
  MyCustomDropDown({
    super.key,
    required this.value,
    // required this.cityData,
    required this.onChanged,
    required this.items,
  });

  String value;
  // final Map<String, List<Map<String, dynamic>>> cityData;
  void Function(String?)? onChanged;
  List<DropdownMenuItem<String>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      value: value,
      isExpanded: true,
      items: items,
      onChanged: onChanged,
      buttonStyleData: ButtonStyleData(
        height: 40,
        width: 160,
        padding: const EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 0.8,
          ),
          color: Theme.of(context).colorScheme.secondary,
        ),
        elevation: 2,
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 25,
          color: Colors.white,
        ),
        iconEnabledColor: Colors.grey,
        iconDisabledColor: Colors.grey,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        width: 200,
        padding: null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Theme.of(context).colorScheme.secondary,
        ),
        elevation: 8,
        offset: const Offset(-20, 0),
        scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
            thumbColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xFFFFFFFF))),
      ),
      menuItemStyleData: MenuItemStyleData(
          height: 40,
          padding: const EdgeInsets.only(left: 14, right: 14),
          overlayColor: MaterialStateProperty.all(Colors.white12)),
    );
  }
}

// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  ActionButton({
    super.key,
    required this.onTap,
    this.iconColor,
    this.btnColor,
  });
  VoidCallback onTap;
  Color? btnColor;
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: btnColor,
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
            child: Icon(
          Icons.edit_note,
          size: 25,
          color: iconColor,
        )),
      ),
    );
  }
}
