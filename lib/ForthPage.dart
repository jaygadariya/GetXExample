import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Forth Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO pop till third page and then second and first
          //TODO while Navigator PopUntil works perfectly as it suppose to be
          //Navigator.popUntil(context, ModalRoute.withName("/secondPage"));
          // TODO [not working] when we pop until name 'secondPage' it shows that page twice
          //Get.until((route) => Get.currentRoute == "/secondPage");
          Get.offNamedUntil(
            "/thirdPage",
            ModalRoute.withName("/"),
            arguments: {"hello", "hello1"},
          );
        },
      ),
    );
  }
}
