import 'dart:convert';

List<AlbumsModel> albumModelFromJson(String str) => List<AlbumsModel>.from(
    json.decode(str).map((x) => AlbumsModel.fromJson(x)));

String albumModelToJson(List<AlbumsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsModel {
  int? _userId;
  int? _id;
  String? _title;

  AlbumsModel({int? userId, int? id, String? title}) {
    if (userId != null) {
      _userId = userId;
    }
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
  }

  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;

  AlbumsModel.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = _userId;
    data['id'] = _id;
    data['title'] = _title;
    return data;
  }
}
