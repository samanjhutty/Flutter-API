import 'dart:convert';

List<TodosModel> todoModelFromJson(String str) =>
    List<TodosModel>.from(json.decode(str).map((x) => TodosModel.fromJson(x)));

String todoModelToJson(List<TodosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodosModel {
  int? _userId;
  int? _id;
  String? _title;
  bool? _completed;

  TodosModel({int? userId, int? id, String? title, bool? completed}) {
    if (userId != null) {
      _userId = userId;
    }
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (completed != null) {
      _completed = completed;
    }
  }

  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  bool? get completed => _completed;
  set completed(bool? completed) => _completed = completed;

  TodosModel.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = _userId;
    data['id'] = _id;
    data['title'] = _title;
    data['completed'] = _completed;
    return data;
  }
}
