import 'package:api/models/albums_model.dart';
import 'package:api/models/comments_model.dart';
import 'package:api/models/photos_model.dart';
import 'package:api/models/posts_model.dart';
import 'package:api/models/todos_model.dart';
import 'package:api/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:api/models/users_models.dart';

class ApiServices {
  Future<List<UsersModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.userEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Sucess
        List<UsersModel> _userModel = usersModelFromJson(response.body);
        return _userModel;
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
        //statusCode == 200 means Sucess
        List<TodosModel> _todoModel = todoModelFromJson(response.body);
        return _todoModel;
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
        //statusCode == 200 means Sucess
        List<PostsModel> _postModel = postModelFromJson(response.body);
        return _postModel;
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
        //statusCode == 200 means Sucess
        List<PhotosModel> _photoModel = photoModelFromJson(response.body);
        return _photoModel;
      }
    } catch (e) {
      debugPrint('Exception:: $e');
    }
    return null;
  }

  Future<List<CommentsModel>?> getComments() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.commentEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Sucess
        List<CommentsModel> _commentModel = commentModelFromJson(response.body);
        return _commentModel;
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
        //statusCode == 200 means Sucess
        List<AlbumsModel> _albumModel = albumModelFromJson(response.body);
        return _albumModel;
      }
    } catch (e) {
      debugPrint('Exception:: $e');
    }
    return null;
  }
}
