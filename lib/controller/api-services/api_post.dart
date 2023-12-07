import 'package:api/models/users_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ApiPostServices extends ChangeNotifier {
  Future<void> createUser({UsersModel? data}) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.userEndpoint);
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to add data');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }
}
