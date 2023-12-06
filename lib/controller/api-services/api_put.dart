import 'dart:convert';

import '../constants.dart';
import 'package:http/http.dart' as http;

class ApiPutServices {
  Future<void> updateUser({int? id, int? userID}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.userEndpoint);
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'title': 'Flutter HTTP CRUD',
            'body': 'This is a blog post about HTTP CRUD methods in Flutter',
            'userId': 1,
          }));
      if (response.statusCode != 201) {
        throw ('Failed to create data');
      }
    } catch (e) {}
  }
}
