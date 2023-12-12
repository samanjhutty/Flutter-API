import 'package:api/models/todos_model.dart';
import 'package:api/view/add-widgets/add_todo.dart';
import 'package:api/view/widgets/todo_completed_actions.dart';
import 'package:api/controller/api-services/api_get.dart';
import 'package:api/view/widgets/todo_pending_action.dart';
import 'package:flutter/material.dart';
import 'package:api/main.dart';
import 'package:get/get.dart';

class Todos extends StatefulWidget {
  const Todos({super.key, required this.userId});

  final int userId;
  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> with TickerProviderStateMixin {
  List<TodosModel>? todoData = [];

  final List<Tab> _tabs = const [
    Tab(text: 'Pending Actions'),
    Tab(text: 'Compeleted Actions')
  ];
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: _tabs.length, vsync: this);
    _getTodosData();
    super.initState();
  }

  void _getActionData() => setState(() {
        completedActions.clear();
        prendingActions.clear();
        for (int i = 0; i < todoData!.length; i++) {
          if (todoData![i].completed == true) {
            completedActions.add(todoData![i]);
          } else {
            prendingActions.add(todoData![i]);
          }
        }
      });

  void _getTodosData() async {
    List<TodosModel>? data = await ApiGetServices().getTodos();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {
              for (int i = 0; i < data!.length; i++) {
                if (data[i].userId == widget.userId) {
                  todoData!.add(data[i]);
                }
              }
              _getActionData();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            tabs: _tabs,
            controller: _controller,
          )),
      body: todoData!.isEmpty
          ? Center(child: noData(data: _getTodosData))
          : TabBarView(
              controller: _controller,
              children: const [TodoPending(), TodoCompleted()]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddTodo()),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
