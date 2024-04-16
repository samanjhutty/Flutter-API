import 'dart:convert';

import 'package:get/get.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class ApiPutServices {
  Future<void> updateUserDetails(
      {required Map<String, dynamic> data, required int id}) async {
    try {
      var url = Uri.parse('${Constants.baseURL + Constants.userEndpoint}/$id');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 200) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'User Updated sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updateTodo(
      {required Map<String, dynamic> data, required int id}) async {
    try {
      var url = Uri.parse('${Constants.baseURL + Constants.todoEndpoint}/$id');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 200) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Todo Updated sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updatePost(
      {required Map<String, dynamic> data, required int id}) async {
    try {
      var url = Uri.parse('${Constants.baseURL + Constants.postEndpoint}/$id');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 200) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Post Updated sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updatePhoto(
      {required Map<String, dynamic> data, required int id}) async {
    try {
      var url = Uri.parse('${Constants.baseURL + Constants.photoEndpoint}/$id');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 200) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Photo Updated sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updateComment(
      {required Map<String, dynamic> data, required int id}) async {
    try {
      var url =
          Uri.parse('${Constants.baseURL + Constants.commentEndpoint}/$id');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 200) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Comment Updated sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updateAlbum(
      {required Map<String, dynamic> data, required int id}) async {
    try {
      var url = Uri.parse('${Constants.baseURL + Constants.albumEndpoint}/$id');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 200) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Post Updated sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }
}
