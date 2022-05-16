import 'package:flutter/material.dart';
import 'package:flutter_todo/themes.dart';
import 'package:flutter_todo/ui/widget/my_text_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../services/theme_services.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  var _dateHintText = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = "9:30 PM";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: headingStyle,
              ),
              const MyTextField(
                  labelText: "Title", hintText: "Enter title here"),
              const MyTextField(labelText: "Note", hintText: "Enter note here"),
              MyTextField(
                  labelText: "Name",
                  hintText: _dateHintText,
                  iconWidget: IconButton(
                    onPressed: () async {
                      var pickedDate = await getDateFromUser();

                      if (pickedDate != null) {
                        setState(() {
                          _dateHintText = DateFormat.yMd().format(pickedDate);
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                    iconSize: 22,
                  )),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      labelText: "Start Time",
                      hintText: startTime,
                      iconWidget: IconButton(
                        onPressed: () {
                          getTimeFromUser(true);
                        },
                        icon: const Icon(Icons.access_time),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: MyTextField(
                      labelText: "End Time",
                      hintText: endTime,
                      iconWidget: IconButton(
                        onPressed: (){
                            getTimeFromUser(false);


                         // setState(() {
                         //   endTime = "pickedTime";
                         // });
                        },
                        icon: const Icon(Icons.access_time),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getTimeFromUser(bool isStartTime) async{
    var pickedTime =  await getTimePicker();

    String formatTime = pickedTime.format(context);

    if(pickedTime==null){
      print("canceled time");
    }else if(isStartTime==true){
      setState(() {
        startTime = formatTime;
      });
    }else if(isStartTime==false){
      setState(() {
        endTime = formatTime;
      });
    }

  }

  getTimePicker()  {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime:
          TimeOfDay(
              hour: int.parse(startTime.split(':')[0]),
              minute: int.parse(startTime.split(':')[1].split(" ")[0]),
          ),
    );
  }

  getDateFromUser() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2123),
    );
  }

  appBar() {
    return AppBar(
      elevation: 1,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: GetBuilder<ThemeServices>(builder: (themeservices) {
          return Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: themeservices.mode ? Colors.white : Colors.black,
          );
        }),
      ),
      actions: [
        GetBuilder<ThemeServices>(builder: (themeservices) {
          return Icon(
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
