import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirstScreen();
  }

  List<String> getList() {
    return List<String>.generate(1000, (index) => "Item $index");
  }

  Widget getListView() {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
          leading: const Icon(Icons.arrow_right),
          title: Text("Item $index"),
          subtitle: const Text("This is my landscapes"),
          trailing: const Icon(Icons.sunny_snowing),
          onTap: () => alertMe(context, "Item $index"));
    });
  }

  int luckyNumber() {
    var random = Random();
    int luckyNumber = random.nextInt(10);
    return luckyNumber;
  }

  void alertMe(BuildContext context, String text) {
    var alertDialog =
        AlertDialog(title: Text(text), content: const Text("assayed"));
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
