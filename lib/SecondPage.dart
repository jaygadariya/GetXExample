import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/main.dart';

import 'Controller/Controller.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("args: ${Get.arguments}");
    Controller controller = Get.find<Controller>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeChangeClass().theme == ThemeMode.dark ? Colors.white : Colors.brown,
        onPressed: () {
          controller.increment();
          //Get.toNamed("/thirdPage");
        },
      ),
      appBar: AppBar(),
      body: Center(
        child: Obx(() => controller.isLoading.value == true ? CircularProgressIndicator() : Text("${controller.counter}")),
      ),
    );
  }
}
