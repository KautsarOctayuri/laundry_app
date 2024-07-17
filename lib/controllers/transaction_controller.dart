import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TransactionController extends GetxController {
  Future<void> createTransaction(String customer, int serviceId, double weight) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/transactions'),
      body: {
        'customer_id': customer,
        'service_id': serviceId.toString(),
        'weight': weight.toString(),
      },
    );

    if (response.statusCode == 201) {
      Get.snackbar('Success', 'Transaction created successfully');
    } else {
      Get.snackbar('Error', 'Failed to create transaction');
    }
  }
}
