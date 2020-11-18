import 'package:get/get.dart';

class Controller extends GetxController {
  var counter = 0;
  RxBool isLoading = false.obs;

  void increment() {
    isLoading.value = true;
/*    Get.dialog(
      SizedBox(
        height: 150,
        width: 250,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      barrierDismissible: false,
    );*/
    counter++;
    update();
    Future.delayed((Duration(seconds: 10)), () {
      //Get.back();
      isLoading.value = false;
    });
  }
}
