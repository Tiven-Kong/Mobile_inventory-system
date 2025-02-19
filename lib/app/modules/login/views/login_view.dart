import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vuthy_mobile/app/routes/app_pages.dart';
import '../controllers/login_provider.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
   final LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 140),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: Get.width / 1.3,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 80, bottom: 40, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Center(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            const Text(
                              "Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                hintText: "name@gmail.com",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 10),
                                prefixIcon:
                                Icon(Icons.email, color: Colors.white),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email cannot be empty';
                                }
                                if (!GetUtils.isEmail(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: "Enter your Password",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 10),
                                prefixIcon:
                                Icon(Icons.key, color: Colors.white),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                } else if (value.length < 8) {
                                  return 'Password must be more than 8 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      final email = emailController.text;
                                      final password = passwordController.text;

                                      Get.dialog(
                                        Center(child: CircularProgressIndicator()),
                                        barrierDismissible: false,
                                      );

                                      try {
                                        final response = await controller.login(email: email, password: password);

                                       // if throw Exception the Catch block will work
                                        if (response != 200 && response != 201) {
                                          throw Exception("Invalid login credentials");
                                        }

                                      } catch (e) {
                                        Get.dialog(
                                          AlertDialog(
                                            title: const Text("Login Failed"),
                                            content: const Text("Invalid credentials. Please try again."),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Get.back(),
                                                child: const Text("Retry"),
                                              ),
                                            ],
                                          ),
                                          barrierDismissible: false,
                                        );
                                      }
                                    }
                                  },
                                  child: const Text("Enter"),
                                ),





                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
