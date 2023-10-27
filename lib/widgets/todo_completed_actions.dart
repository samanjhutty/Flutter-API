import 'package:api/main.dart';
import 'package:api/models/todos_model.dart';
import 'package:flutter/material.dart';

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

    return Container(
        color: scheme.surface,
        child: completedActions.isEmpty
            ? Center(
                child: noData(data: () {}),
              )
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
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Colors.grey,
                              value: completedActions[i].completed,
                              onChanged: (value) {
                                setState(() {
                                  completedActions[i].completed = value;
                                  if (completedActions[i].completed == false) {
                                    prendingActions.add(completedActions[i]);
                                    completedActions.removeAt(i);
                                  }
                                });
                              })));
                }));
  }
}
