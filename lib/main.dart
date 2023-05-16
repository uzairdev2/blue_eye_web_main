import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import 'Core/Provider/model_provider.dart';
import 'Core/Provider/violation_provider.dart';
import 'Core/Screens Routings/screens_routings.dart';
import 'Core/Constants/Common Colors/colors.dart';
import 'Core/Side Bar/side_bar.dart';
import 'Core/Utils/Sizer.dart';
import 'Screens/Routes Screen/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var height = Get.height;
var width = Get.width;

Future<void> main() async {
  runApp(MyApp());

  await ScreenUtil.ensureScreenSize();
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(1160, 800),
      designSize: Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => RoutesProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => UserTableModel(),
            ),
            ChangeNotifierProvider(
              create: (_) => ViolationProvider(),
            ),
          ],
          // Screen_util initialization
          child: GetMaterialApp(
              title: 'Blue Eye',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: mainColor,
                useMaterial3: true,
                scaffoldBackgroundColor: white,
                buttonTheme: const ButtonThemeData(
                  buttonColor: mainColor,
                ),
                textTheme: TextTheme(
                  headlineSmall: TextStyle(
                    color: Colors.black,
                    fontSize: 46.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                appBarTheme: AppBarTheme(
                  color: mainColor.withOpacity(0.6),
                ),
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  secondary: mainColor,
                  background: white,
                ),
              ),
              home: child),
        );
      },
      child: Builder(
        builder: (context) {
          // final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isMobile
                ? AppBar(
                    backgroundColor: white,
                    title: Text(
                      _getTitleByIndex(_controller.selectedIndex),
                      style: const TextStyle(
                        color: black,
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: black,
                      ),
                    ),
                  )
                : null,
            drawer: SideBar(controller: _controller),
            body: Row(
              children: [
                // if (!isMobile) SideBar(controller: _controller),
                !isMobile ? SideBar(controller: _controller) : Container(),
                Expanded(
                  child: Center(
                    child: ScreensRouting(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Reg/Status';
      case 2:
        return 'Routes';
      case 3:
        return 'Prices';
      case 4:
        return 'Violations';
      case 5:
        return 'Payments';
      case 6:
        return 'Company Requests';
      default:
        return 'Not found page';
    }
  }
}
