import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices{
  final _box = GetStorage();
  final _key= 'isDarkMode';
  void _saveData(bool isDarkMode){
    _box.write(_key, isDarkMode);
  }
  bool _mode() => _box.read(_key)??false;

  ThemeMode get theme =>_mode()?ThemeMode.dark: ThemeMode.light;

  void switchTheme(){
    Get.changeThemeMode(_mode()?ThemeMode.light:ThemeMode.dark);
    _saveData(!_mode());

  }

}