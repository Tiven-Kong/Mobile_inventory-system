import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/appbar_controller.dart';

class AppbarView extends GetView<AppbarController> {
  const AppbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add action for notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Add action for settings
            },
          ),
        ],
      ),
    );
  }
}
