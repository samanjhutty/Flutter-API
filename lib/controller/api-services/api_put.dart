import 'package:api/models/albums_model.dart';
import 'package:api/models/comments_model.dart';
import 'package:api/models/photos_model.dart';
import 'package:api/models/posts_model.dart';
import 'package:api/models/todos_model.dart';
import 'package:api/models/users_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class ApiPutServices extends ChangeNotifier {
  Future<void> updateUserDetails({UsersModel? body}) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseURL + ApiConstants.userEndpoint}/${body!.id}');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to update User Details');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updateTodo({TodosModel? body}) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseURL + ApiConstants.todoEndpoint}/${body!.id}');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to update Todo');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updatePost({PostsModel? body}) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseURL + ApiConstants.postEndpoint}/${body!.id}');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to update Post');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updatePhoto({PhotosModel? body}) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseURL + ApiConstants.photoEndpoint}/${body!.id}');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to change Photo');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updateComment({CommentsModel? body}) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseURL + ApiConstants.commentEndpoint}/${body!.id}');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to update Comment');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> updateAlbum({AlbumsModel? body}) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseURL + ApiConstants.albumEndpoint}/${body!.id}');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to update Album');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }
}
