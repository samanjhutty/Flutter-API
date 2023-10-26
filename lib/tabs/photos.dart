import 'package:api/main.dart';
import 'package:api/models/photos_model.dart';
import 'package:api/widgets/image_preview.dart';
import 'package:api/provider/api_services.dart';
import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});
  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  List<PhotosModel>? _photoData = [];

  @override
  void initState() {
    _getPhotos();
    super.initState();
  }

  void _getPhotos() async {
    _photoData = await ApiServices().getPhotos();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    return _photoData!.isEmpty
        ? Center(child: noData(data: _getPhotos))
        : Column(children: [
            Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 4),
                child: const Row(children: [
                  Text('Gallery',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey)),
                ])),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        device.orientation == Orientation.landscape ? 8 : 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8),
                itemCount: _photoData!.length,
                itemBuilder: (BuildContext context, i) => GridTile(
                  footer:
                      GridTileBar(title: Text(_photoData![i].title.toString())),
                  child: Card(
                    child: InkWell(
                      onTap: () => showDialog(
                          context: context,
                          builder: ((_) => ImagePreview(
                              url: _photoData![i].url!,
                              caption: _photoData![i].title!))),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.network(_photoData![i].thumbnailUrl!)),
                    ),
                  ),
                ),
              ),
            )
          ]);
  }
}
