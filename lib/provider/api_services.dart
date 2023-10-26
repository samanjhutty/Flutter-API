import 'package:api/models/albums_model.dart';
import 'package:api/models/comments_model.dart';
import 'package:api/models/photos_model.dart';
import 'package:api/models/posts_model.dart';
import 'package:api/models/todos_model.dart';
import 'package:api/provider/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:api/models/users_models.dart';

class ApiServices {
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
      debugPrint('Exception:: $e');
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
      debugPrint('Exception:: $e');
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
      debugPrint('Exception:: $e');
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
      debugPrint('Exception:: $e');
    }
    return null;
  }

  Future<List<CommentsModel>?> getComments(int postId) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.commentEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Success
        List<CommentsModel> commentModel =
            commentModelFromJson(response.body, postId);
        return commentModel;
      }
    } catch (e) {
      debugPrint('Exception:: $e');
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
      debugPrint('Exception:: $e');
    }
    return null;
  }
}
