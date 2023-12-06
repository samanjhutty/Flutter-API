import 'package:api/models/albums_model.dart';
import 'package:api/models/comments_model.dart';
import 'package:api/models/photos_model.dart';
import 'package:api/models/posts_model.dart';
import 'package:api/models/todos_model.dart';
import 'package:api/controller/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:api/models/users_models.dart';

class ApiGetServices {
  Future<List<UsersModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.userEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Success
        List<UsersModel> userModel = usersModelFromJson(response.body);
        return userModel;
      }
    } catch (e) {
      print('Exception:: $e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
    return null;
  }

  Future<List<TodosModel>?> getTodos() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.todoEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Success
        List<TodosModel> todoModel = todoModelFromJson(response.body);
        return todoModel;
      }
    } catch (e) {
      print('Exception:: $e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
    return null;
  }

  Future<List<PostsModel>?> getPosts() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.postEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Success
        List<PostsModel> postModel = postModelFromJson(response.body);
        return postModel;
      }
    } catch (e) {
      print('Exception:: $e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
    return null;
  }

  Future<List<PhotosModel>?> getPhotos() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.photoEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Success
        List<PhotosModel> photoModel = photoModelFromJson(response.body);
        return photoModel;
      }
    } catch (e) {
      print('Exception:: $e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
    return null;
  }

  Future<List<CommentsModel>?> getComments() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.commentEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Success
        List<CommentsModel> commentModel = commentModelFromJson(response.body);
        return commentModel;
      }
    } catch (e) {
      print('Exception:: $e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
    return null;
  }

  Future<List<AlbumsModel>?> getAlbums() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.albumEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Success
        List<AlbumsModel> albumModel = albumModelFromJson(response.body);
        return albumModel;
      }
    } catch (e) {
      print('Exception:: $e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
    return null;
  }
}
