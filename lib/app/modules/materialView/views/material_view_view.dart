import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/material_view_controller.dart';

class MaterialViewView extends GetView<MaterialViewController> {
  const MaterialViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MaterialViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
