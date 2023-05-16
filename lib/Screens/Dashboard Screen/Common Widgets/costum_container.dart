import 'package:blue_eye_web/Core/Utils/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Constants/Common Colors/colors.dart';

// ignore: must_be_immutable
class CostumContainer extends StatelessWidget {
  CostumContainer({
    required this.title,
    required this.icon,
    required this.text,
    required this.color,
    super.key,
  });

  String title;
  String text;
  IconData icon;
  // ignore: prefer_typing_uninitialized_variables
  var color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 350.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: color,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: isDesktop ? 15.sp : 18.sp,
                        color: white,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Icon(
                    icon,
                    color: Colors.white70,
                    // size: isDesktop ? 20.sp : 45.sp,
                    size: 45.sp,
                  ),
                )
              ],
            ),
            Text(
              text,
              style: const TextStyle(color: white),
            )
          ],
        ),
      ),
    );
  }
}
