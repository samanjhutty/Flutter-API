import 'dart:ui';
import 'package:api/controller/constants.dart';
import 'package:api/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dbcontroller.dart';

class Users extends GetView<DbController> {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          TextButton(
              style: TextButton.styleFrom(alignment: Alignment.center),
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'))
        ],
        contentPadding: const EdgeInsets.all(8),
        actionsPadding: const EdgeInsets.only(bottom: 16, right: 16),
        insetPadding: const EdgeInsets.all(16),
        actionsAlignment: MainAxisAlignment.end,
        title: const Text('Switch User'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: controller.userList.isEmpty
              ? Center(child: noData(data: () => controller.getUserData()))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.userList.length,
                  itemBuilder: (context, i) => Card(
                        child: InkWell(
                            onTap: () {
                              if (box.get(Constants.userId) ==
                                  controller.userList[i].id) {
                                Navigator.pop(context);
                              } else {
                                box.put(Constants.userId,
                                    controller.userList[i].id);
                                controller.userId =
                                    controller.userList[i].id ?? 1;
                              }
                              Navigator.pop(context);
                              controller.getAllData(home: false);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: CircleAvatar(
                                          radius: 16,
                                          child: Text(controller.userList[i].id
                                              .toString())),
                                    ),
                                    Expanded(
                                        child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Text(
                                              controller.userList[i].name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontFeatures: [
                                                    FontFeature.swash()
                                                  ],
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.left,
                                            ))),
                                    Expanded(
                                        child: Text(
                                      controller.userList[i].email.toString(),
                                      textAlign: TextAlign.left,
                                    )),
                                  ]),
                            )),
                      )),
        ));
  }
}
