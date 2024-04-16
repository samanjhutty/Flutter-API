import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ApiDeleteServices {
  Future<void> deleteUser({required int? id}) async {
    try {
      final url =
          Uri.parse('${Constants.baseURL + Constants.userEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        Get.rawSnackbar(message: 'User deleted sucessfully');
      } else {
        Get.rawSnackbar(message: 'Failed to delete User');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deleteTodos({required int? id}) async {
    try {
      final url =
          Uri.parse('${Constants.baseURL + Constants.todoEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        Get.rawSnackbar(message: 'Todo deleted sucessfully');
      } else {
        Get.rawSnackbar(message: 'Failed to delete Todo');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deletePosts({required int? id}) async {
    try {
      final url =
          Uri.parse('${Constants.baseURL + Constants.postEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        Get.rawSnackbar(message: 'Post deleted sucessfully');
      } else {
        Get.rawSnackbar(message: 'Failed to delete Post');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deletePhotos({required int? id}) async {
    try {
      final url =
          Uri.parse('${Constants.baseURL + Constants.photoEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        Get.rawSnackbar(message: 'Photo deleted sucessfully');
      } else {
        Get.rawSnackbar(message: 'Failed to delete Photo');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deleteComments({required int? id}) async {
    try {
      final url =
          Uri.parse('${Constants.baseURL + Constants.commentEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        Get.rawSnackbar(message: 'Comment deleted sucessfully');
      } else {
        Get.rawSnackbar(message: 'Failed to delete Comment');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }

  Future<void> deleteAlbums({required int? id}) async {
    try {
      final url =
          Uri.parse('${Constants.baseURL + Constants.albumEndpoint}/$id');
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        Get.rawSnackbar(message: 'Album deleted sucessfully');
      } else {
        Get.rawSnackbar(message: 'Failed to delete Album');
      }
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }
}
