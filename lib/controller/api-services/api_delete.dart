import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ApiDeleteServices extends ChangeNotifier {
  Future<void> deleteUser({int? id}) async {
    try {
      final url =
          Uri.parse('${ApiConstants.baseURL + ApiConstants.userEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to delete User');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deleteTodos({int? id}) async {
    try {
      final url =
          Uri.parse('${ApiConstants.baseURL + ApiConstants.todoEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to delete Todo');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deletePosts({int? id}) async {
    try {
      final url =
          Uri.parse('${ApiConstants.baseURL + ApiConstants.postEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to delete Post');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deletePhotos({int? id}) async {
    try {
      final url =
          Uri.parse('${ApiConstants.baseURL + ApiConstants.photoEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to delete Photo(s)');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deleteComments({int? id}) async {
    try {
      final url = Uri.parse(
          '${ApiConstants.baseURL + ApiConstants.commentEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to delete Comment(s)');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deleteAlbums({int? id}) async {
    try {
      final url =
          Uri.parse('${ApiConstants.baseURL + ApiConstants.albumEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to delete Album');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }
}
