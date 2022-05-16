import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/themes.dart';

import '../../services/theme_services.dart';
class MyTextField extends StatelessWidget {

  final String labelText;
  final String hintText;
  final Widget? iconWidget;
  final Function? onTap;
  const MyTextField({Key? key,required this.labelText,required this.hintText,this.iconWidget,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText,
            style: titleTextStyle,

          ),
          const SizedBox(height: 7,),
          Container(
            padding: const EdgeInsets.only(left: 10,bottom: 8),
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1,color: Colors.grey)
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: ThemeServices().mode?Colors.white:Colors.black54,
                    readOnly:iconWidget==null?false:true,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: subTitleTextStyle,

                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)
                      ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                        )

                    ),
                  ),
                ),
                iconWidget==null?Container():Container(child: iconWidget,),



              ],
            ),
          )
        ],
      ),
    );
  }
}
