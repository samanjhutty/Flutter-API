import 'package:api/models/albums_model.dart';
import 'package:api/models/comments_model.dart';
import 'package:api/models/photos_model.dart';
import 'package:api/models/posts_model.dart';
import 'package:api/models/todos_model.dart';
import 'package:api/models/users_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ApiPostServices extends ChangeNotifier {
  Future<void> postUser({UsersModel? data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.userEndpoint);
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to add User');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> postTodo({TodosModel? data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.todoEndpoint);
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to add Todo');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> postUserPost({PostsModel? data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.postEndpoint);
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to post a Post');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> postPhoto({PhotosModel? data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.photoEndpoint);
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to post Photo');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> postComments({CommentsModel? data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.commentEndpoint);
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to post comment');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> postAlbum({AlbumsModel? data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.albumEndpoint);
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to post Album');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }
}
