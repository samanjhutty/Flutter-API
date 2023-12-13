import 'package:flutter/material.dart';
import '../widgets/assets.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
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
              Text('Post Photo',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: scheme.primary)),
              const Text('Post a new Photo',
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
