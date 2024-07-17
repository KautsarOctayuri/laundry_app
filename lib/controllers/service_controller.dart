import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceController extends GetxController {
  var services = [].obs;

  Future<void> fetchServices() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/services'),
    );

    if (response.statusCode == 200) {
      services.value = json.decode(response.body);
    } else {
      Get.snackbar('Error', 'Failed to load services');
    }
  }
}
