import 'dart:convert';

List<CommentsModel> commentModelFromJson(String str, int postId) =>
    List<CommentsModel>.from(
        json.decode(str).map((x) => CommentsModel.fromJson(x, postId)));

String commentModelToJson(List<CommentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsModel(
      {int? postId, int? id, String? name, String? email, String? body}) {
    if (postId != null) {
      this.postId = postId;
    }
    if (id != null) {
      this.id = id;
    }
    if (name != null) {
      this.name = name;
    }
    if (email != null) {
      this.email = email;
    }
    if (body != null) {
      this.body = body;
    }
  }

  CommentsModel.fromJson(Map<String, dynamic> json, int postId) {
    postId = postId;
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
