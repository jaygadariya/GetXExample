import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_example/ForthPage.dart';
import 'package:getx_example/SecondPage.dart';
import 'package:getx_example/ThirdPage.dart';

import 'Controller/Controller.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        "/": (context) => MyHomePage(),
        "/secondPage": (context) => SecondPage(),
        "/thirdPage": (context) => ThirdPage(),
        "/forthPage": (context) => ForthPage(),
      },
      title: 'Flutter Getx Demo',
      themeMode: ThemeChangeClass().theme,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        primarySwatch: primaryBlack,
        scaffoldBackgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put<Controller>(Controller(), permanent: false);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("GetX Example"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeChangeClass().theme == ThemeMode.dark ? Colors.white : Colors.brown,
        onPressed: () {
          controller.increment();
          // getDialog(context); //TODO GetX Dialog with result
          //getBottomSheet(); //TODO GetX Bottom sheet
          //showSnackBar(context); //TODO GetX SnackBar
          //Get.toNamed("/secondPage"); //TODO go to second page and so on till forth
          // print(GetUtils.isEmail("amrita@jsc.com")); //TODO check if email is validate or not
          //ThemeChangeClass().changeTheme(); //TODO change the theme
        },
      ),
      body: Stack(
        children: [
          GetBuilder<Controller>(
            builder: (val) {
              return Text(
                "${val.counter}",
                style: TextStyle(color: Colors.amber),
              );
            },
          ),
          Obx(() {
            if (controller.isLoading.value == true) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return SizedBox();
          }),
        ],
      ),
    );
  }

  getDialog(context) {
    Get.defaultDialog(
      middleText: "Dialog made in 3 lines of code",
      actions: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(Get.context, true);
                },
                child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(Get.context, false);
                },
                child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text("Cancel"),
                ),
              ),
            ),
          ],
        ),
      ],
    ).then((value) {
      print("value after pop dialog is :-  $value"); //TODO get Value after dialog pop
    });
  }

  getBottomSheet() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.music_note,
              ),
              title: Text('Music'),
              onTap: () => {Get.back()},
            ),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }

  showSnackBar(BuildContext context) {
    //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("hello")));

    Get.rawSnackbar(
      message: 'Hello',
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: Get.context.width,
      snackStyle: SnackStyle.GROUNDED,
      isDismissible: false,
      showProgressIndicator: true,
      duration: Duration(hours: 2),
      mainButton: FlatButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          "BACK",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class ThemeChangeClass {
  final _box = GetStorage();
  final _key = 'isDarkEnable';

  ThemeMode get theme => _isDark() ? ThemeMode.dark : ThemeMode.light;

  bool _isDark() => _box.read(_key) ?? false;

  _saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);

  changeTheme() {
    Get.changeThemeMode(_isDark() ? ThemeMode.light : ThemeMode.dark);
    _saveTheme(!_isDark());
  }
}
