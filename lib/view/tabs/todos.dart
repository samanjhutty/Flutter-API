import 'package:api/controller/dbcontroller.dart';
import 'package:api/view/widgets/todo_completed_actions.dart';
import 'package:api/view/widgets/todo_pending_action.dart';
import 'package:flutter/material.dart';
import 'package:api/main.dart';
import 'package:get/get.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> with TickerProviderStateMixin {
  final List<Tab> _tabs = const [
    Tab(text: 'Pending Actions'),
    Tab(text: 'Compeleted Actions')
  ];
  TabController? _tabController;
  DbController controller = Get.find();

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            tabs: _tabs,
            controller: _tabController,
          )),
      body: Obx(
        () => controller.todoList.isEmpty
            ? Center(child: noData(data: controller.getTodosData))
            : TabBarView(
                controller: _tabController,
                children: const [TodoPending(), TodoCompleted()]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add-todo'),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
