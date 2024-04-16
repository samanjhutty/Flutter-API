import 'package:api/controller/api-services/api_delete.dart';
import 'package:api/controller/dbcontroller.dart';
import 'package:api/main.dart';
import 'package:api/view/add-widgets/add_post.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:api/view/widgets/comments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Posts extends GetView<DbController> {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Obx(
      () => controller.isDetailsLoading.value
          ? Center(child: noData(data: controller.getPostsData))
          : Scaffold(
              body: RefreshIndicator(
                onRefresh: () => controller.getPostsData(),
                child: Column(children: [
                  Container(
                      color: scheme.surface,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 4),
                      child: const Row(children: [
                        Text('Posts',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey)),
                      ])),
                  Expanded(
                      child: ListView.builder(
                          itemCount: controller.postsList.length,
                          itemBuilder: (context, i) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: CircleAvatar(
                                              child: Text(controller
                                                  .postsList[i].id
                                                  .toString())),
                                          titleTextStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: scheme.onSurface),
                                          title: Text(
                                              controller.postsList[i].title!),
                                          trailing: moreButton(
                                              scheme: scheme,
                                              editTap: () => Get.to(AddPost(
                                                  data:
                                                      controller.postsList[i])),
                                              deleteTap: () async {
                                                await ApiDeleteServices()
                                                    .deletePosts(
                                                        id: controller
                                                            .postsList[i].id);
                                                Get.close(1);
                                              },
                                              content: 'Post')),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 8),
                                          child: Text(
                                              controller.postsList[i].body!)),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                                onPressed: () =>
                                                    Get.to(Comments(
                                                      postId: controller
                                                          .postsList[i].id,
                                                    )),
                                                child:
                                                    const Text('Show Commets')),
                                          ]),
                                      const Divider(thickness: 0.3)
                                    ]));
                          }))
                ]),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => Get.toNamed('/add-post'),
                child: const Icon(Icons.add),
              ),
            ),
    );
  }
}
