import 'package:api/controller/api-services/api_post.dart';
import 'package:api/controller/api-services/api_put.dart';
import 'package:api/models/todos_model.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key, this.data});
  final TodosModel? data;
  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final formKey = GlobalKey<FormState>();
  TextEditingController todoController = TextEditingController(text: '');
  bool? completed = false;

  Box box = Hive.box('APIbox');
  @override
  void initState() {
    if (widget.data != null) {
      todoController.text = widget.data!.title!;
      completed = widget.data!.completed;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return Material(
        child: SafeArea(
            child: Scaffold(
      appBar: myAppBar(),
      body: Center(
          child: Form(
        key: formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Todo Action',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: scheme.primary)),
              const Text('Add a new Task',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 360
                          : 450,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Title cannot be empty!';
                            } else {
                              return null;
                            }
                          },
                          controller: todoController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Todo Title')),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('[0-9]+')),
                          ],
                          keyboardType: TextInputType.text),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Completed',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              Checkbox(
                                  value: completed,
                                  onChanged: (value) => setState(() {
                                        completed = value!;
                                      })),
                              const SizedBox(),
                              const SizedBox()
                            ])),
                    Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(children: [
                          Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20)),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      if (widget.data != null) {
                                        await ApiPutServices().updateTodo(
                                            id: widget.data!.id!,
                                            data: TodosModel(
                                                    userId: box.get('id',
                                                        defaultValue: 1),
                                                    title: todoController.text,
                                                    id: widget.data!.id,
                                                    completed: completed)
                                                .toJson());
                                        Get.until(ModalRoute.withName('/'));
                                      } else {
                                        await ApiPostServices().postTodo(
                                            data: TodosModel(
                                                    userId: box.get('id',
                                                        defaultValue: 1),
                                                    title: todoController.text,
                                                    completed: completed)
                                                .toJson());
                                        Get.until(ModalRoute.withName('/'));
                                      }
                                    }
                                  },
                                  child: const Text('Save'))),
                        ]))
                  ]))
            ])),
      )),
    )));
  }
}
