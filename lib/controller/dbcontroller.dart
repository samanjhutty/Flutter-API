import 'package:api/models/albums_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/posts_model.dart';
import '../models/todos_model.dart';
import '../models/users_models.dart';
import 'api-services/api_get.dart';
import 'constants.dart';

Box box = Hive.box('APIbox');

class DbController extends GetxController {
  RxList<PostsModel> postsList = <PostsModel>[].obs;
  RxList<AlbumsModel> albumList = <AlbumsModel>[].obs;
  RxList<TodosModel> todoList = <TodosModel>[].obs;
  RxList<UsersModel> userList = <UsersModel>[].obs;
  RxList<TodosModel> completedActions = <TodosModel>[].obs;
  RxList<TodosModel> prendingActions = <TodosModel>[].obs;

  Rx<UsersModel>? userData;
  RxBool isDetailsLoading = false.obs;
  RxBool isHomeLoading = false.obs;
  RxDouble homeLoadPerc = 0.0.obs;
  int userId = box.get(Constants.userId, defaultValue: 1);

  @override
  void onInit() {
    if (Get.arguments != null) {
      userId = Get.arguments[0];
    }
    getAllData();
    super.onInit();
  }

  void getAllData({bool home = true}) async {
    isHomeLoading.value = home;
    await getPostsData();
    homeLoadPerc.value = 0.2;

    await getAlbumData();
    homeLoadPerc.value = 0.4;

    await getTodosData();
    homeLoadPerc.value = 0.6;

    await getUserData();
    homeLoadPerc.value = 0.8;

    await getUserList();
    homeLoadPerc.value = 1;

    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => isHomeLoading.value = false);
  }

  Future<void> getAlbumData() async {
    isDetailsLoading.value = true;
    List<AlbumsModel>? data = await ApiGetServices().getAlbums();
    Future.delayed(const Duration(milliseconds: 1)).then((value) {
      for (int i = 0; i < data!.length; i++) {
        if (data[i].userId == userId) {
          albumList.add(data[i]);
        }
      }
    });
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => isDetailsLoading.value = false);
  }

  Future<void> getPostsData() async {
    isDetailsLoading.value = true;
    postsList.value = await ApiGetServices().getPosts() ?? [];
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => isDetailsLoading.value = false);
  }

  Future<void> getUserData() async {
    isDetailsLoading.value = true;
    List<UsersModel>? data = await ApiGetServices().getUsers();
    Future.delayed(const Duration(milliseconds: 1)).then((value) {
      for (int i = 0; i < data!.length; i++) {
        if (data[i].id == userId) {
          userData = data[i].obs;
          break;
        }
      }
    });
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => isDetailsLoading.value = false);
  }

  void _getActionData() {
    completedActions.clear();
    prendingActions.clear();
    for (int i = 0; i < todoList.length; i++) {
      if (todoList[i].completed == true) {
        completedActions.add(todoList[i]);
      } else {
        prendingActions.add(todoList[i]);
      }
    }
  }

  Future<void> getTodosData() async {
    isDetailsLoading.value = true;
    List<TodosModel>? data = await ApiGetServices().getTodos();
    Future.delayed(const Duration(milliseconds: 1)).then((value) {
      for (int i = 0; i < data!.length; i++) {
        if (data[i].userId == userId) {
          todoList.add(data[i]);
        }
      }
      _getActionData();
    });
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => isDetailsLoading.value = false);
  }

  Future<void> getUserList() async {
    userList.value = await ApiGetServices().getUsers() ?? [];
  }
}
