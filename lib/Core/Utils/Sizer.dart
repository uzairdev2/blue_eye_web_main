import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

var height = Get.height;
var width = Get.width;

bool isMobile = width < 650.w;

bool isTablet = width < 1100 && width >= 650;

bool isDesktop = width > 650.w;
