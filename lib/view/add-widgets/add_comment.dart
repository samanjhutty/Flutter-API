import 'package:flutter/material.dart';
import '../widgets/assets.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return Material(
        child: Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Center(
            child: Form(
          key: formKey,
          child: Column(
            children: [
              Text('Post Comment',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: scheme.primary)),
              const Text('Post a new Comment',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20)),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {}
                            },
                            child: const Text('Save'))),
                  ]))
            ],
          ),
        )),
      ),
    ));
  }
}
