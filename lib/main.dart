
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './app_screens/first_screen.dart';

void main() => runApp(const MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("First App Testing",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
              backgroundColor: Colors.red,
            ),
            body: getListView()));
  }

  List<String> getList() {
    return List<String>.generate(1000, (index) => "Item $index");
  }

  Widget getListView() {
    return ListView.builder(itemBuilder: (context,index){
      return ListTile(
          leading: const Icon(Icons.arrow_right),
          title: Text("Item $index"),
          subtitle: const Text("This is my landscapes"),
          trailing: const Icon(Icons.sunny_snowing),
          onTap: () => alertMe(context,"Item $index"));
    });

    var listView = ListView(
      children: [
        ListTile(
            leading: Icon(Icons.landscape),
            title: Text("Landscape"),
            subtitle: Text("This is my landscapes"),
            trailing: Icon(Icons.sunny_snowing),
            onTap: () => debugPrint("click me")),
        ListTile(
            leading: Icon(Icons.landscape),
            title: Text("Landscape"),
            subtitle: Text("This is my landscapes"),
            trailing: Icon(Icons.sunny_snowing),
            onTap: () => debugPrint("Click his"))
      ],
    );
    return listView;
  }
  int luckyNumber() {
    var random = Random();
    int luckyNumber = random.nextInt(10);
    return luckyNumber;
  }
  void alertMe(BuildContext context, String text) {
    var alertDialog =  AlertDialog(
        title:  Text(text), content: const Text("assayed"));
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
