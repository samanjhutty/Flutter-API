import 'dart:convert';

List<PostsModel> postModelFromJson(String str) =>
    List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String postModelToJson(List<PostsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({int? userId, int? id, String? title, String? body}) {
    if (userId != null) {
      this.userId = userId;
    }
    if (id != null) {
      this.id = id;
    }
    if (title != null) {
      this.title = title;
    }
    if (body != null) {
      this.body = body;
    }
  }

  PostsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
