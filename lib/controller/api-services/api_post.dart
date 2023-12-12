import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ApiPostServices {
  Future<void> postTodo({required Map<String, dynamic> data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.todoEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 201) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Todo added sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> createUser({required Map<String, dynamic> data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.userEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 201) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'User added sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> postUserPost({required Map<String, dynamic> data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.postEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 201) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Post added sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> postPhoto({required Map<String, dynamic> data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.photoEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 201) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Photo added sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> postComments({required Map<String, dynamic> data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.commentEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 201) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Comment added sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> postAlbum({required Map<String, dynamic> data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.albumEndpoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode != 201) {
        Get.rawSnackbar(
            message: 'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        Get.rawSnackbar(message: 'Post added sucessfully');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }
}
