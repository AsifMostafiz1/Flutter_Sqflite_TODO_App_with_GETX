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
            child: const Icon(Icons.dark_mode_sharp)),

        actions: const [
          Icon(Icons.account_circle_outlined),
          SizedBox(width: 20,)
        ],
      ),

      body: const Center(
        child: Text("Hello Flutter"),
      ),
    );
  }
}
