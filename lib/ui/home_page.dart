import 'package:flutter/material.dart';
import 'package:flutter_todo/services/notification_services.dart';
import 'package:flutter_todo/services/theme_services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   var notificationService;
   var darkMode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     notificationService = NotificationServices();
     notificationService.initializeNotification();
     notificationService.requestIOSPermissions();
     darkMode = Get.isDarkMode;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),

      body: Center(
        child: TextButton(
          onPressed: (){
            setState(() {
              darkMode=!darkMode;
            });
          },
          child:  Text(darkMode?"Dark Mode":"Light Mode"),
        ),
      )
    );
  }

  appBar(){
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            //initState();
            ThemeServices().switchTheme();
            notificationService.displayNotification(
                title:"Theme Changed",
                body: Get.isDarkMode? "Light Mode Activate":"Dark Mode Active"
            );
            //print(Get.isDarkMode);
            setState(() {
              darkMode=!darkMode;
            });
            print(darkMode);
            //print(isLightMode);
            // notificationService.scheduledNotification();
          },
          child: Icon(
            darkMode?Icons.nightlight_round:Icons.wb_sunny_outlined,

            size: 20,
            color: darkMode?Colors.white:Colors.black,
          )
      ),
      actions:  [
        Icon(Icons.account_circle_outlined,color: darkMode?Colors.white:Colors.black,size: 35,),
        // ignore: prefer_const_constructors
        SizedBox(width: 20,)
      ],
    );
  }
}
