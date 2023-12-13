import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ApiDeleteServices {
  Future<void> deleteUser({required int? id}) async {
    try {
      final url =
          Uri.parse('${ApiConstants.baseURL + ApiConstants.userEndpoint}/$id');
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
          Uri.parse('${ApiConstants.baseURL + ApiConstants.todoEndpoint}/$id');
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
          Uri.parse('${ApiConstants.baseURL + ApiConstants.postEndpoint}/$id');
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
          Uri.parse('${ApiConstants.baseURL + ApiConstants.photoEndpoint}/$id');
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
      final url = Uri.parse(
          '${ApiConstants.baseURL + ApiConstants.commentEndpoint}/$id');
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
          Uri.parse('${ApiConstants.baseURL + ApiConstants.albumEndpoint}/$id');
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
