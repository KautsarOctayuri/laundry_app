import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/controllers/transaction_controller.dart';
//import 'package:laundry_app/controllers/customer_controller.dart';

class InputPage extends StatelessWidget {
  final Map service;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TransactionController transactionController = Get.put(TransactionController());

  InputPage({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: 'Berat (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: customerController,
              decoration: InputDecoration(labelText: 'Customer'),
            ),
            SizedBox(height: 20),
            Obx(() {
              double weight = double.tryParse(weightController.text) ?? 0;
              double total = weight * service['price_per_kg'];
              return Text('Total Harga: $total');
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                transactionController.createTransaction(
                  customerController.text,
                  service['id'],
                  double.tryParse(weightController.text) ?? 0,
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
