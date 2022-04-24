import 'package:flutter/material.dart';
import 'package:flutter_todo/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            ThemeServices().SwitchTheme();
          },
            child: ThemeServices().icon,
        ),
        actions: const [
          Icon(Icons.account_circle_outlined),
         SizedBox(width: 20,)
        ],
      ),

      body: Center(
        child: TextButton(
          onPressed: (){
            ThemeServices().SwitchTheme();
          },
          child: const Text("Change Mode"),
        ),
      )
    );
  }
}
