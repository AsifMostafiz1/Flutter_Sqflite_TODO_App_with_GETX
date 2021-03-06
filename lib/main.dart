import 'package:flutter/material.dart';
import 'package:flutter_todo/services/theme_services.dart';
import 'package:flutter_todo/ui/home_page.dart';
import 'package:flutter_todo/themes.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'services/theme_services.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => ThemeServices());
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,


      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: const HomePage(),
    );
  }
}
