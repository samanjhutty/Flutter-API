import 'package:api/controller/api-services/api_delete.dart';
import 'package:api/controller/api-services/api_post.dart';
import 'package:api/controller/api-services/api_put.dart';
import 'package:api/models/albums_model.dart';
import 'package:api/controller/api-services/api_get.dart';
import 'package:api/view/widgets/album_photos.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  List<AlbumsModel>? list = [];
  int userId = box.get('id');

  @override
  void initState() {
    _getAlbumData();
    super.initState();
  }

  void _getAlbumData() async {
    List<AlbumsModel>? data = await ApiGetServices().getAlbums();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {
              for (int i = 0; i < data!.length; i++) {
                if (data[i].userId == userId) {
                  list!.add(data[i]);
                }
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return list!.isEmpty
        ? Center(child: noData(data: _getAlbumData))
        : Scaffold(
            body: Padding(
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
                        itemCount: list?.length,
                        itemBuilder: (context, i) => ListTile(
                            onTap: () =>
                                Get.to(AlbumPhotos(albumId: list![i].id!)),
                            contentPadding: const EdgeInsets.all(8),
                            title: Text(list![i].title!),
                            titleTextStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: scheme.onSurface),
                            trailing: moreButton(
                                scheme: scheme,
                                editTap: () {
                                  TextEditingController albumController =
                                      TextEditingController(
                                          text: list![i].title);

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
                                                    title: albumController.text)
                                                .toJson(),
                                            id: list![i].id!);
                                        Get.close(1);
                                      });
                                },
                                deleteTap: () async {
                                  ApiDeleteServices()
                                      .deleteAlbums(id: list![i].id);
                                  Get.back();
                                },
                                content: 'Album'))))
              ]),
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
                            border: OutlineInputBorder(), label: Text('Title')),
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
          );
  }
}
