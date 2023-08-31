import 'package:api/models/todos_model.dart';
import 'package:api/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:api/main.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});
  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  List<TodosModel>? todoData = [];
  TextStyle textStyle = const TextStyle();

  @override
  void initState() {
    super.initState();
    _getTodosData();
  }

  void _getTodosData() async {
    todoData = await ApiServices().getTodos();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey[100],
        child: todoData!.isEmpty
            ? noData(data: () => _getTodosData())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 4),
                    child: const Row(
                      children: [
                        Text('Pending Actions',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: todoData!.length,
                        itemBuilder: (context, i) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: CheckboxListTile(
                                    title: Text(
                                      todoData![i].title.toString(),
                                      style: textStyle,
                                      key: ValueKey(todoData![i].id),
                                    ),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor: Colors.blue,
                                    value: todoData![i].completed as bool,
                                    onChanged: (value) {
                                      setState(() {
                                        todoData![i].completed = value;
                                        if (todoData![i].completed == true) {
                                          textStyle = const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough);
                                        } else {
                                          textStyle = const TextStyle();
                                        }
                                      });
                                    }),
                              ),
                            )),
                  ),
                ],
              ),
      );
}
