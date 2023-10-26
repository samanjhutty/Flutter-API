import 'package:api/models/albums_model.dart';
import 'package:api/provider/api_services.dart';
import 'package:api/widgets/album_photos.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});
  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  List<AlbumsModel>? list = [];
  @override
  void initState() {
    _getAlbumData();
    super.initState();
  }

  void _getAlbumData() async {
    list = await ApiServices().getAlbums();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return list!.isEmpty
        ? Center(child: noData(data: _getAlbumData))
        : Column(children: [
            Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 4),
                child: const Row(children: [
                  Text('Albums',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey)),
                ])),
            Expanded(
                child: ListView.builder(
                    itemCount: list?.length,
                    itemBuilder: (context, i) => ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Material(
                                      child:
                                          AlbumPhotos(albumId: list![i].id!)))),
                          contentPadding: const EdgeInsets.all(8),
                          title: Text(list![i].title!),
                          trailing: Icon(Icons.arrow_forward_rounded,
                              color: Theme.of(context).colorScheme.secondary),
                        )))
          ]);
  }
}
