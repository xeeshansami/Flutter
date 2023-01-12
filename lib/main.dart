import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './app_screens/first_screen.dart';
void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget{

  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("First App Testing",textAlign: TextAlign.right),
            backgroundColor: Colors.red,
          ),
          body: FirstScreen()
        ));
  }

}
