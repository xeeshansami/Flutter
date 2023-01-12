import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return textVIew();
    // return const Center(
    //   child: Image(
    //     image: AssetImage('assets/images/abc.jpg'),
    //   ),
    // );
  }

  Widget textVIew() {
    return Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            "Your lucky number is " + luckyNumber().toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w800))),
                    Expanded(
                        child: Text(
                            "Your lucky number is " + luckyNumber().toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w800))),
                    Expanded(
                        child: Text(
                            "Your lucky number is " + luckyNumber().toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w800)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            "Your lucky number is " + luckyNumber().toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w800))),
                    Expanded(
                        child: Text(
                            "Your lucky number is " + luckyNumber().toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w800))),
                    Expanded(
                        child: Text(
                            "Your lucky number is " + luckyNumber().toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w800)))
                  ],
                ),
                const imagePicker(),
                const myButton(),
              ],
            )));
  }

  int luckyNumber() {
    var random = Random();
    int luckyNumber = random.nextInt(10);
    return luckyNumber;
  }

  Widget getListView() {
    var listView = ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.landscape),
          title: Text("Landscape"),
          subtitle: Text("This is my landscapes"),
          trailing: Icon(Icons.sunny_snowing),
        )
      ],
    );
    return listView;
  }
}

class imagePicker extends StatelessWidget {
  const imagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/abc.jpg");
    Image image = Image(image: assetImage, width: 100.0, height: 100.0);
    return Container(child: image);
  }
}

class myButton extends StatelessWidget {
  const myButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.black12,
        textStyle: const TextStyle(fontSize: 30.0));
    const eds = EdgeInsets.all(10.0);
    return Container(
        width: 250.0,
        height: 50.0,
        padding: eds,
        margin: eds,
        child: ElevatedButton(
          style: style,
          onPressed: () => alertMe(context),
          child: const Text("Click Me",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w800)),
        ));
  }

  void alertMe(BuildContext context) {
    var alertDialog = const AlertDialog(
        title: Text("ALERT!"), content: Text("This is my alert dialog"));
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}

class floatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          snackBar(context, "this is my text");
        },
        child: Icon(Icons.add),
        tooltip: "Add more items");
  }

  void snackBar(BuildContext context, String text) {
    var snackbar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: () => {debugPrint("UNDO Text")},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
