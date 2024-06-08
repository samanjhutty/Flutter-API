import 'dart:convert';

List<TodosModel> todoModelFromJson(String str) =>
    List<TodosModel>.from(json.decode(str).map((x) => TodosModel.fromJson(x)));

String todoModelToJson(List<TodosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodosModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodosModel({int? userId, int? id, String? title, bool? completed}) {
    if (userId != null) {
      this.userId = userId;
    }
    if (id != null) {
      this.id = id;
    }
    if (title != null) {
      this.title = title;
    }
    if (completed != null) {
      this.completed = completed;
    }
  }

  TodosModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
