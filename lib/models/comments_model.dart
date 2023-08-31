import 'dart:convert';

List<CommentsModel> commentModelFromJson(String str) =>
    List<CommentsModel>.from(
        json.decode(str).map((x) => CommentsModel.fromJson(x)));

String commentModelToJson(List<CommentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentsModel {
  int? _postId;
  int? _id;
  String? _name;
  String? _email;
  String? _body;

  CommentsModel(
      {int? postId, int? id, String? name, String? email, String? body}) {
    if (postId != null) {
      _postId = postId;
    }
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (email != null) {
      _email = email;
    }
    if (body != null) {
      _body = body;
    }
  }

  int? get postId => _postId;
  set postId(int? postId) => _postId = postId;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get body => _body;
  set body(String? body) => _body = body;

  CommentsModel.fromJson(Map<String, dynamic> json) {
    _postId = json['postId'];
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = _postId;
    data['id'] = _id;
    data['name'] = _name;
    data['email'] = _email;
    data['body'] = _body;
    return data;
  }
}
