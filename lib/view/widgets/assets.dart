import 'package:flutter/material.dart';
import 'package:get/get.dart';

mydialog(
        {required BuildContext context,
        required String title,
        required String content,
        required VoidCallback ontap}) =>
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              actionsPadding: const EdgeInsets.only(bottom: 16, right: 16),
              insetPadding: const EdgeInsets.all(16),
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(onPressed: ontap, child: const Text('Yes')),
                TextButton(onPressed: () => Get.back(), child: const Text('No'))
              ]);
        });
myAppBar() => AppBar(
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_rounded)));
myTableRowDivider(BuildContext context) {
  double tablespacing = MediaQuery.of(context).size.height * 0.03;

  return TableRow(children: [
    SizedBox(
        height: tablespacing,
        child: Padding(
          padding: EdgeInsets.only(right: tablespacing * 2),
          child: const Divider(),
        )),
    SizedBox(
        height: tablespacing,
        child: Padding(
          padding: EdgeInsets.only(right: tablespacing),
          child: const Divider(),
        ))
  ]);
}
