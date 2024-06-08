import 'package:api/controller/dbcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';
import 'assets.dart';

class TodoCompleted extends GetView<DbController> {
  const TodoCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      child: Container(
          margin: const EdgeInsets.only(top: 4),
          color: scheme.surface,
          child: Obx(
            () => controller.isDetailsLoading.value
                ? Center(
                    child: noData(data: () => controller.getTodosData()),
                  )
                : controller.completedActions.isEmpty
                    ? const Center(
                        child: Text('No Tasks Completed...',
                            style: TextStyle(color: Colors.grey)))
                    : ListView.builder(
                        itemCount: controller.completedActions.length,
                        itemBuilder: (context, i) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      color: scheme.onInverseSurface),
                                  child: CheckboxListTile(
                                      title: Text(
                                        controller.completedActions[i].title!,
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey),
                                      ),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.grey,
                                      value: controller
                                          .completedActions[i].completed,
                                      onChanged: (value) {
                                        mydialog(
                                            context: context,
                                            title: 'Mark Pending',
                                            content: const Text(
                                                'Move Todo to Pending tasks'),
                                            ontap: () {
                                              controller.completedActions[i]
                                                  .completed = value;
                                              Get.back();
                                              if (controller.completedActions[i]
                                                      .completed ==
                                                  false) {
                                                controller.prendingActions.add(
                                                    controller
                                                        .completedActions[i]);
                                                controller.completedActions
                                                    .removeAt(i);
                                              }
                                            });
                                      })));
                        }),
          )),
    );
  }
}
