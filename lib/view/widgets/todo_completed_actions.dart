import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/todos_model.dart';
import 'assets.dart';

class TodoCompleted extends StatefulWidget {
  const TodoCompleted({super.key});

  @override
  State<TodoCompleted> createState() => _TodoCompletedState();
}

class _TodoCompletedState extends State<TodoCompleted> {
  @override
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      child: Container(
          margin: const EdgeInsets.only(top: 4),
          color: scheme.surface,
          child: completedActions.isEmpty
              ? const Center(
                  child: Text('No Tasks Completed...',
                      style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  itemCount: completedActions.length,
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
                                  completedActions[i].title!,
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                activeColor: Colors.grey,
                                value: completedActions[i].completed,
                                onChanged: (value) {
                                  mydialog(
                                      context: context,
                                      title: 'Mark Pending',
                                      content: const Text(
                                          'Move Todo to Pending tasks'),
                                      ontap: () => setState(() {
                                            completedActions[i].completed =
                                                value;
                                            Get.back();
                                            if (completedActions[i].completed ==
                                                false) {
                                              prendingActions
                                                  .add(completedActions[i]);
                                              completedActions.removeAt(i);
                                            }
                                          }));
                                })));
                  })),
    );
  }
}
