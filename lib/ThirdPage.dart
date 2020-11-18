import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Third Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/forthPage");
        },
      ),
    );
  }
}
