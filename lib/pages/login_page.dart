import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/controllers/user_controller.dart';
import 'package:laundry_app/pages/service_page.dart';

class LoginPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await userController.login(
                  emailController.text,
                  passwordController.text,
                );
                if (userController.isLoggedIn.value) {
                  Get.to(ServicePage());
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
