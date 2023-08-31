import 'package:api/main.dart';
import 'package:api/models/photos_model.dart';
import 'package:api/services/api_services.dart';
import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});
  @override
  _PhotosState createState() => _PhotosState();
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
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => Container(
      child: _photoData!.isEmpty
          ? noData(data: _getPhotos)
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemCount: _photoData!.length,
              itemBuilder: (BuildContext context, i) => GridTile(
                footer:
                    GridTileBar(title: Text(_photoData![i].title.toString())),
                child: InkWell(
                    onTap: () {},
                    child: Card(
                        child: Image.network(_photoData![i].url.toString()))),
              ),
            ));
}
