import 'package:api/controller/api-services/api_post.dart';
import 'package:api/controller/api-services/api_put.dart';
import 'package:api/models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/constants.dart';
import '../../controller/dbcontroller.dart';
import '../widgets/assets.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key, this.data});

  final PostsModel? data;
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    if (widget.data != null) {
      titleController.text = widget.data!.title!;
      contentController.text = widget.data!.body!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return Material(
        child: Scaffold(
      appBar: myAppBar(),
      body: Center(
          child: Form(
        key: formKey,
        child: SizedBox(
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? 360
              : 450,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add Post',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: scheme.primary)),
                const Text('Add a new Post',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Title cannot be empty';
                      } else {
                        return null;
                      }
                    },
                    controller: titleController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Title')),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    controller: contentController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'content is required';
                      } else {
                        return null;
                      }
                    },
                    expands: true,
                    maxLines: null,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Content'),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(children: [
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20)),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  if (widget.data != null) {
                                    await ApiPutServices().updatePost(
                                      data: PostsModel(
                                              userId: box.get(Constants.userId),
                                              title: titleController.text,
                                              body: contentController.text)
                                          .toJson(),
                                      id: widget.data!.id!,
                                    );
                                    Get.until(ModalRoute.withName('/'));
                                  } else {
                                    ApiPostServices().postUserPost(
                                        data: PostsModel(
                                                userId:
                                                    box.get(Constants.userId),
                                                title: titleController.text,
                                                body: contentController.text)
                                            .toJson());
                                    Get.until(ModalRoute.withName('/'));
                                  }
                                }
                              },
                              child: const Text('Save'))),
                    ]))
              ],
            ),
          ),
        ),
      )),
    ));
  }
}
