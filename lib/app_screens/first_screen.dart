import 'dart:math';

import 'package:flutter/material.dart';

TextEditingController principleController = TextEditingController();
TextEditingController rateController = TextEditingController();
TextEditingController termsController = TextEditingController();
String calculatedValue = "";

class FirstScreen extends StatefulWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return textVIew();
  //   // return const Center(
  //   //   child: Image(
  //   //     image: AssetImage('assets/images/abc.jpg'),
  //   //   ),
  //   // );
  // }

  /*Widget textVIew() {
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
  }*/

  @override
  State<StatefulWidget> createState() {
    return _myState();
  }
}

class _myState extends State<FirstScreen> {
  String userInput = "";
  var currenciesArray = {'Rupees', 'Dollers', 'Pounds'};
  var selectedCurrentValue = "Rupees";

  @override
  Widget build(BuildContext context) {
    TextStyle theme = Theme.of(context).textTheme.subtitle1!!;
    return Scaffold(
      appBar: AppBar(
        title: Text("StateFullWidget"),
      ),
      body: Container(
        child: ListView(
          children: [
            image(),
            Container(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: principleController,
                      style: theme,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          label: Text("Principle"),
                          hintText: "Enter Principle in e.g 12000"),
                      onSubmitted: (String userInput) {
                        setState(() {
                          this.userInput = userInput;
                        });
                      },
                    ))),
            Container(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: rateController,
                      style: theme,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          label: Text("Rate Interest"),
                          hintText: "Enter rate interest e.g 12000"),
                    ))),
            Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: termsController,
                      style: theme,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          label: Text("Terms"),
                          hintText: "Enter rate interest e.g 12000"),
                    )),
                    Container(
                      margin: EdgeInsets.all(5),
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                            style: theme,
                            items: currenciesArray.map((String dropdownValue) {
                              return DropdownMenuItem<String>(
                                  child: Text(dropdownValue),
                                  value: dropdownValue);
                            }).toList(),
                            value: selectedCurrentValue,
                            onChanged: (String? a) {
                              onChange(a!!);
                            })),
                    Text(calculatedValue)
                  ],
                )),
            Row(
              children: [
                Expanded(child: calculateButton()),
                Expanded(child: resetButton())
              ],
            )
          ],
        ),
      ),
    );
  }

  Container image() {
    var padMargin = const EdgeInsets.all(10.0);
    AssetImage imageAssets = const AssetImage("assets/images/abc.jpg");
    Image image = Image(image: imageAssets);
    return Container(
      padding: padMargin,
      margin: padMargin,
      width: 100.0,
      height: 100.0,
      child: image,
    );
  }

  void onChange(String newValue) {
    setState(() {
      this.selectedCurrentValue = newValue;
    });
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

class calculateButton extends StatelessWidget {
  const calculateButton({Key? key}) : super(key: key);

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
          onPressed: () => calculatedValue = calculate(),
          child: const Text("Calculate",
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

  String calculate() {
    double principle = double.parse(principleController.text);
    double rate = double.parse(rateController.text);
    double terms = double.parse(termsController.text);
    double result = principle + (principle * rate * terms) / 100;
    return "After $terms years, your investment will be worth $result";
  }
}

class resetButton extends StatelessWidget {
  const resetButton({Key? key}) : super(key: key);

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
          child: const Text("Reset",
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
