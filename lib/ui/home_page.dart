import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/services/notification_services.dart';
import 'package:flutter_todo/services/theme_services.dart';
import 'package:flutter_todo/themes.dart';
import 'package:flutter_todo/ui/widget/add_task_page.dart';
import 'package:flutter_todo/ui/widget/my_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
    darkMode = ThemeServices().mode;
  }

  @override
  Widget build(BuildContext context) {
    DateTime  _selectedDate = DateTime.now();
    return Scaffold(
        appBar: appBar(),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              buildAddTaskbar(),

              const SizedBox(height: 5,),

              buildDatePicker(_selectedDate)
            ],
          ),
        ));
  }

  DatePicker buildDatePicker(DateTime _selectedDate) {
    return DatePicker(

              DateTime.now(),
              height: 90,
              width: 70,
              selectionColor: Colors.blue,
              initialSelectedDate: DateTime.now(),
              selectedTextColor: Colors.white,
              daysCount: 30,
              dateTextStyle: GoogleFonts.lato(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600
              ),

              monthTextStyle: GoogleFonts.lato(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600
              ),
              dayTextStyle: GoogleFonts.lato(

                  fontSize: 12,
                color: Colors.grey,
                  fontWeight: FontWeight.w600,
              ),
              onDateChange: (date){
                _selectedDate = date;
              },



            );
  }

  Row buildAddTaskbar() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<ThemeServices>(builder: (dataclass){
                     return Text(
                        DateFormat.yMMMd().format(DateTime.now()).toString(),
                        style: subHeadingStyle,
                      );
                    }),
                    GetBuilder<ThemeServices>(builder: (dataclass){
                      return Text(
                        "Today",
                        style: headingStyle,
                      );
                    })
                  ],
                ),

                 MyButton(label: "+ Add Task",onTap:()=>Get.to(const AddTaskPage()))

              ],
            );
  }

  appBar() {
    return AppBar(
      elevation: 1,
      leading: GestureDetector(
        onTap: () {
          Get.find<ThemeServices>().switchTheme();
          //ThemeServices().switchTheme();
          print(ThemeServices().mode);
          notificationService.displayNotification(
              title:"Theme Changed",
              body: Get.isDarkMode? "Light Mode Activate":"Dark Mode Active"
          );
        },
        child: GetBuilder<ThemeServices>(builder: (themeservices) {
          return Icon(
            ThemeServices().mode
                ? Icons.nightlight_round
                : Icons.wb_sunny_outlined,
            size: 20,
            color: themeservices.mode ? Colors.white : Colors.black,
          );
        }),
      ),



      actions: [
        GetBuilder<ThemeServices>(builder: (themeservices) {
          return  Icon(
            Icons.account_circle_outlined,
            color: ThemeServices().mode ? Colors.white : Colors.black,
            size: 35,
          );
        }),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
