import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarWidget extends StatelessWidget {
  AppbarWidget({this.screeName, super.key});

  String? screeName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      title: Text(
        screeName!,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      // backgroundColor: mainColor,
    );
  }
}
