import 'package:api/models/todos_model.dart';
import 'package:api/widgets/todo_completed_actions.dart';
import 'package:api/provider/api_services.dart';
import 'package:api/widgets/todo_pending_action.dart';
import 'package:flutter/material.dart';
import 'package:api/main.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});
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

  void _getTodosData() async {
    todoData = await ApiServices().getTodos();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {
              completedActions.clear();
              prendingActions.clear();
              for (int i = 0; i < todoData!.length; i++) {
                if (todoData![i].completed == true) {
                  completedActions.add(todoData![i]);
                } else {
                  prendingActions.add(todoData![i]);
                }
              }
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
                children: const [TodoPending(), TodoCompleted()]));
  }
}
