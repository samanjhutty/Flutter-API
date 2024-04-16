import 'package:api/controller/dbcontroller.dart';
import 'package:api/main.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/api-services/api_delete.dart';
import '../add-widgets/add_todo.dart';

class TodoPending extends GetView<DbController> {
  const TodoPending({super.key});

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
                : controller.prendingActions.isEmpty
                    ? const Center(
                        child: Text('No Pending Tasks...',
                            style: TextStyle(color: Colors.grey)))
                    : RefreshIndicator(
                        onRefresh: () => controller.getTodosData(),
                        child: ListView.builder(
                            itemCount: controller.prendingActions.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: scheme.onInverseSurface),
                                      child: CheckboxListTile(
                                          title: Text(controller
                                              .prendingActions[i].title!),
                                          secondary: moreButton(
                                              scheme: scheme,
                                              editTap: () => Get.to(AddTodo(
                                                  data: controller
                                                      .prendingActions[i])),
                                              deleteTap: () async {
                                                ApiDeleteServices().deleteTodos(
                                                    id: controller
                                                        .prendingActions[i].id);
                                                Get.back();
                                                controller.prendingActions
                                                    .removeAt(i);
                                              },
                                              content: 'Todo'),
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Colors.blue,
                                          value: controller
                                              .prendingActions[i].completed,
                                          onChanged: (value) {
                                            mydialog(
                                                context: context,
                                                title: 'Mark Completed',
                                                content: const Text(
                                                    'Will be moved to Completed Actions'),
                                                ontap: () {
                                                  controller.prendingActions[i]
                                                      .completed = value;
                                                  Get.back();
                                                  if (controller
                                                          .prendingActions[i]
                                                          .completed ==
                                                      true) {
                                                    controller.completedActions
                                                        .add(controller
                                                            .prendingActions[i]);
                                                    controller.prendingActions
                                                        .removeAt(i);
                                                  }
                                                });
                                          })));
                            }),
                      ),
          )),
    );
  }
}
