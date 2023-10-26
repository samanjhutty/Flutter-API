import 'dart:convert';

List<PhotosModel> photoModelFromJson(String str) => List<PhotosModel>.from(
    json.decode(str).map((x) => PhotosModel.fromJson(x)));

String photoModelToJson(List<PhotosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotosModel(
      {int? albumId,
      int? id,
      String? title,
      String? url,
      String? thumbnailUrl}) {
    if (albumId != null) {
      this.albumId = albumId;
    }
    if (id != null) {
      this.id = id;
    }
    if (title != null) {
      this.title = title;
    }
    if (url != null) {
      this.url = url;
    }
    if (thumbnailUrl != null) {
      this.thumbnailUrl = thumbnailUrl;
    }
  }

  PhotosModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
