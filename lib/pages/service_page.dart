import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/controllers/service_controller.dart';
import 'package:laundry_app/pages/input_page.dart';

class ServicePage extends StatelessWidget {
  final ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    serviceController.fetchServices();

    return Scaffold(
      appBar: AppBar(title: Text('Pilih Jenis Cuci')),
      body: Obx(() {
        if (serviceController.services.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: serviceController.services.length,
            itemBuilder: (context, index) {
              var service = serviceController.services[index];
              return ListTile(
                title: Text(service['name']),
                onTap: () {
                  Get.to(InputPage(service: service));
                },
              );
            },
          );
        }
      }),
    );
  }
}
