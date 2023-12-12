import 'package:api/models/todos_model.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/api-services/api_delete.dart';
import '../add-widgets/add_todo.dart';

class TodoPending extends StatefulWidget {
  const TodoPending({super.key});

  @override
  State<TodoPending> createState() => _TodoPendingState();
}

class _TodoPendingState extends State<TodoPending> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      child: Container(
          margin: const EdgeInsets.only(top: 4),
          color: scheme.surface,
          child: prendingActions.isEmpty
              ? const Center(
                  child: Text('No Pending Tasks...',
                      style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  itemCount: prendingActions.length,
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
                                title: Text(prendingActions[i].title!),
                                secondary: PopupMenuButton(
                                    child: const Icon(Icons.more_vert),
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                              child: const Row(children: [
                                                Icon(Icons.edit),
                                                SizedBox(width: 16),
                                                Text('Edit')
                                              ]),
                                              onTap: () {
                                                Get.to(() => AddTodo(
                                                      data: prendingActions[i],
                                                    ));
                                              }),
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
                                                  title: 'Delete Todo',
                                                  content:
                                                      'Delete this todo and its contents',
                                                  ontap: () async {
                                                    await ApiDeleteServices()
                                                        .deleteTodos(
                                                            id: prendingActions[
                                                                    i]
                                                                .id);
                                                    setState(() {
                                                      prendingActions
                                                          .removeAt(i);
                                                    });
                                                    Get.close(1);
                                                  }))
                                        ]),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                activeColor: Colors.blue,
                                value: prendingActions[i].completed,
                                onChanged: (value) {
                                  mydialog(
                                      context: context,
                                      title: 'Mark Completed',
                                      content:
                                          'Will be moved to Completed Actions',
                                      ontap: () => setState(() {
                                            prendingActions[i].completed =
                                                value;
                                            Get.back();
                                            if (prendingActions[i].completed ==
                                                true) {
                                              completedActions
                                                  .add(prendingActions[i]);
                                              prendingActions.removeAt(i);
                                            }
                                          }));
                                })));
                  })),
    );
  }
}
