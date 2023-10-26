import 'dart:convert';

List<AlbumsModel> albumModelFromJson(String str) => List<AlbumsModel>.from(
    json.decode(str).map((x) => AlbumsModel.fromJson(x)));

String albumModelToJson(List<AlbumsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsModel {
  int? userId;
  int? id;
  String? title;

  AlbumsModel({int? userId, int? id, String? title}) {
    if (userId != null) {
      this.userId = userId;
    }
    if (id != null) {
      this.id = id;
    }
    if (title != null) {
      this.title = title;
    }
  }

  AlbumsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
