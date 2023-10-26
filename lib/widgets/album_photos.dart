import 'package:flutter/material.dart';
import '../main.dart';
import '../models/photos_model.dart';
import '../provider/api_services.dart';
import 'image_preview.dart';

class AlbumPhotos extends StatefulWidget {
  const AlbumPhotos({super.key, required this.albumId});

  final int albumId;
  @override
  State<AlbumPhotos> createState() => _AlbumPhotosState();
}

class _AlbumPhotosState extends State<AlbumPhotos> {
  List<PhotosModel>? photoData = [];

  @override
  void initState() {
    _getPhotos();
    super.initState();
  }

  void _getPhotos() async {
    List<PhotosModel>? data = await ApiServices().getPhotos();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {
              for (int i = 0; i < data!.length; i++) {
                if (data[i].albumId == widget.albumId) {
                  photoData!.add(data[i]);
                }
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                iconSize: 20,
                splashRadius: 16,
                color: Colors.grey,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                )),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.grey),
            title: const Text('Album Photos')),
        body: photoData!.isEmpty
            ? Center(child: noData(data: _getPhotos))
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        device.orientation == Orientation.landscape ? 8 : 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8),
                itemCount: photoData!.length,
                itemBuilder: (BuildContext context, i) => GridTile(
                  footer:
                      GridTileBar(title: Text(photoData![i].title.toString())),
                  child: Card(
                    child: InkWell(
                      onTap: () => showDialog(
                          context: context,
                          builder: ((_) => ImagePreview(
                              url: photoData![i].url!,
                              caption: photoData![i].title!))),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.network(photoData![i].thumbnailUrl!)),
                    ),
                  ),
                ),
              ));
  }
}
