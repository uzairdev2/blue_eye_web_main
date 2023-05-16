import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/Common Colors/colors.dart';

class CommonDialog {
  String? name;
  String? message;
  showErrorDialog({
    required String name,
    message,
  }) {
    Get.dialog(AlertDialog(
      backgroundColor: white,
      title: Column(
        children: [
          Align(alignment: Alignment.topLeft, child: Text(name)),
        ],
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const SizedBox(
            width: 57,
            height: 39,
            child: Text("No"),
          ),
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const SizedBox(
            width: 57,
            height: 39,
            child: Text("No"),
          ),
        ),
      ],
    ));
  }
}
