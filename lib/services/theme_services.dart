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

   Icon get icon => _mode()?  Icon(Icons.dark_mode):  Icon(Icons.light_mode);




  // ignore: non_constant_identifier_names
  void SwitchTheme(){
    Get.changeThemeMode(_mode()?ThemeMode.light:ThemeMode.dark);
    _saveData(!_mode());

  }

}