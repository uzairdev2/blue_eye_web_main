import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../Screens/Login Screen/Login_Screen.dart';
import '../Constants/Common Colors/colors.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: sideBArBackgroundColor,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: black.withOpacity(0.2))),
        hoverColor: hoverColor,
        textStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
        selectedTextStyle: const TextStyle(color: Colors.black),
        itemTextPadding: EdgeInsets.only(left: 30.w),
        selectedItemTextPadding: EdgeInsets.only(left: 30.w),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: grey),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: Colors.grey,
          ),
          gradient: LinearGradient(
            colors: [actionColor, mainColor.withOpacity(0.3)],
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.28),
          //     blurRadius: 30,
          //   )
          // ],
        ),
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.6),
          size: 20.sp,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.black,
          size: 20.sp,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 250.w,
        decoration: BoxDecoration(
            color: sideBArBackgroundColor,
            border: Border.all(color: black.withOpacity(0.2))),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100.h,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                "Blue Eye",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 127, 127),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              )),
        );
      },
      items: [
        const SidebarXItem(
          icon: Icons.home,
          label: 'Dashboard',
        ),
        const SidebarXItem(
          icon: Icons.report,
          label: 'Reg/Status',
        ),
        const SidebarXItem(
          icon: Icons.route,
          label: 'Routes',
        ),
        const SidebarXItem(
          icon: Icons.price_change_rounded,
          label: 'Prices',
        ),
        const SidebarXItem(
          icon: Icons.warning,
          label: 'Violations',
        ),
        const SidebarXItem(
          icon: Icons.payments_sharp,
          label: 'Payments',
        ),
        const SidebarXItem(
          icon: Icons.add_box,
          label: 'Company Requests',
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const LoginScreen();
            }));
          },
        ),
      ],
    );
  }
}
