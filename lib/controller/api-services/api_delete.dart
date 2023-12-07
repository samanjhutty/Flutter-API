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
        throw Exception('Failed to delete data');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }
}
