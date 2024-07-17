import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserController extends GetxController {
  var isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/login'),
      body: {'email': email, 'password': password, 'position': 'admin'},
    );

    if (response.statusCode == 200) {
      isLoggedIn.value = true;
    } else {
      Get.snackbar('Error', 'data belum ada');
    }
  }
}
