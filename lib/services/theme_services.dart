import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';


class ThemeServices extends GetxController{



  final _box = GetStorage();
  final _key= 'isDarkMode';
  void _saveData(bool isDarkMode){
    _box.write(_key, isDarkMode);
  }

  bool _mode() => _box.read(_key)??false;

  void switchTheme(){
    _saveData(!_mode());
    print(_mode().toString()+">>>>>");
    //print(_mode());
    //_mode()?ThemeMode.light:ThemeMode.dark;
    Get.changeThemeMode(_mode()?ThemeMode.dark:ThemeMode.light);
    update();
  }

  bool get mode=> _mode();

  ThemeMode get theme =>_mode()?ThemeMode.dark: ThemeMode.light;




}
