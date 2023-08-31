import 'dart:convert';

List<PostsModel> postModelFromJson(String str) =>
    List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String postModelToJson(List<PostsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModel {
  int? _userId;
  int? _id;
  String? _title;
  String? _body;

  PostsModel({int? userId, int? id, String? title, String? body}) {
    if (userId != null) {
      _userId = userId;
    }
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (body != null) {
      _body = body;
    }
  }

  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get body => _body;
  set body(String? body) => _body = body;

  PostsModel.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = _userId;
    data['id'] = _id;
    data['title'] = _title;
    data['body'] = _body;
    return data;
  }
}
