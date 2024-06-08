import 'package:api/controller/api-services/api_delete.dart';
import 'package:api/controller/api-services/api_post.dart';
import 'package:api/controller/api-services/api_put.dart';
import 'package:api/controller/dbcontroller.dart';
import 'package:api/models/albums_model.dart';
import 'package:api/view/widgets/album_photos.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';

class Albums extends GetView<DbController> {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Obx(
      () => controller.isDetailsLoading.value
          ? Center(child: noData(data: controller.getAlbumData))
          : Scaffold(
              body: RefreshIndicator(
                onRefresh: () => controller.getAlbumData(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(children: [
                    Container(
                        color: scheme.surface,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 4),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Albums',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey)),
                            ])),
                    Expanded(
                        child: ListView.builder(
                            itemCount: controller.albumList.length,
                            itemBuilder: (context, i) => ListTile(
                                onTap: () => Get.to(AlbumPhotos(
                                    albumId: controller.albumList[i].id!)),
                                contentPadding: const EdgeInsets.all(8),
                                title: Text(controller.albumList[i].title!),
                                titleTextStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: scheme.onSurface),
                                trailing: moreButton(
                                    scheme: scheme,
                                    editTap: () {
                                      TextEditingController albumController =
                                          TextEditingController(
                                              text: controller
                                                  .albumList[i].title);

                                      mydialog(
                                          context: context,
                                          content: TextFormField(
                                            controller: albumController,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                label: Text('Title')),
                                          ),
                                          noText: 'Cancel',
                                          yesText: 'Update',
                                          title: 'Create Album',
                                          ontap: () async {
                                            await ApiPutServices().updateAlbum(
                                                data: AlbumsModel(
                                                        userId: box.get('id'),
                                                        title: albumController
                                                            .text)
                                                    .toJson(),
                                                id: controller
                                                    .albumList[i].id!);
                                            Get.close(1);
                                          });
                                    },
                                    deleteTap: () async {
                                      ApiDeleteServices().deleteAlbums(
                                          id: controller.albumList[i].id);
                                      Get.back();
                                    },
                                    content: 'Album'))))
                  ]),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
                  label: const Text('New Album'),
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    TextEditingController albumController =
                        TextEditingController();
                    mydialog(
                        context: context,
                        content: TextFormField(
                          controller: albumController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Title')),
                        ),
                        noText: 'Cancel',
                        yesText: 'Create',
                        title: 'Create Album',
                        ontap: () async {
                          await ApiPostServices().postAlbum(
                              data: AlbumsModel(
                                      userId: box.get('id'),
                                      title: albumController.text)
                                  .toJson());
                          Get.close(1);
                        });
                  }),
            ),
    );
  }
}
