import 'package:api/models/albums_model.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AlbumPhotos extends StatefulWidget {
  const AlbumPhotos({super.key, required this.albumId});

  final int albumId;
  @override
  State<AlbumPhotos> createState() => _AlbumPhotosState();
}

class _AlbumPhotosState extends State<AlbumPhotos> {
  List<AlbumsModel> list = [];

  @override
  void initState() {
    _getAlbumData();
    super.initState();
  }

  void _getAlbumData() {}

  @override
  Widget build(BuildContext context) {
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
        body: list!.isEmpty
            ? Center(child: noData(data: _getAlbumData))
            : ListView.builder(
                itemCount: list?.length,
                itemBuilder: (context, index) => const ListTile()));
  }
}
