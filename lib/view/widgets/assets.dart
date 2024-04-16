import 'package:flutter/material.dart';
import 'package:get/get.dart';

mydialog(
        {required BuildContext context,
        required String title,
        required Widget content,
        required VoidCallback ontap,
        String yesText = 'Yes',
        String noText = 'No'}) =>
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              actionsPadding: const EdgeInsets.only(bottom: 16, right: 16),
              insetPadding: const EdgeInsets.all(16),
              title: Text(title),
              content: content,
              actions: [
                TextButton(onPressed: ontap, child: Text(yesText)),
                TextButton(onPressed: () => Get.back(), child: Text(noText))
              ]);
        });
moreButton(
        {required ColorScheme scheme,
        required VoidCallback editTap,
        required VoidCallback deleteTap,
        required String content}) =>
    PopupMenuButton(
        position: PopupMenuPosition.under,
        icon: Icon(Icons.more_vert, color: scheme.primary),
        itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                  onTap: editTap,
                  child: const Row(children: [
                    Icon(Icons.edit),
                    SizedBox(width: 16),
                    Text('Edit')
                  ])),
              PopupMenuItem(
                  child: Row(children: [
                    Icon(
                      Icons.delete,
                      color: scheme.error,
                    ),
                    const SizedBox(width: 16),
                    const Text('Delete')
                  ]),
                  onTap: () => mydialog(
                      context: context,
                      title: 'Delete $content',
                      content:
                          Text('Do you wich to Delete the current $content'),
                      ontap: deleteTap))
            ]);

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
