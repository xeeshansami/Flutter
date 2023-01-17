import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class details_screen extends StatefulWidget {
  var title = "";

  details_screen(this.title);

  @override
  State<StatefulWidget> createState() {
    return stateFullWidget(title);
  }
}

class stateFullWidget extends State<details_screen> {
  var title = "";

  stateFullWidget(this.title);

  var priorities = ["High", "Low", "Medium"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.black12,
      textStyle: const TextStyle(fontSize: 30.0));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (){
          moveToLastScreen();
          return Future.value(true);
        },
        child: Scaffold(
        appBar: AppBar(
        title: Text(title),
    leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
    moveToLastScreen();
    }),
    ),
    body: bodyOfDetails()));
  }

  Padding bodyOfDetails() {
    TextStyle? theme = Theme
        .of(context)
        .textTheme
        .titleSmall;
    var pads = EdgeInsets.all(10.0);
    return Padding(
        padding: pads,
        child: ListView(
          children: [
            Container(
                margin: pads,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 0.80),
                ),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton(
                        items: priorities.map((String selectedValue) {
                          return DropdownMenuItem<String>(
                            child: Text(selectedValue),
                            value: selectedValue,
                          );
                        }).toList(),
                        value: priorities[1],
                        onChanged: (valueSelectedByUser) {
                          setState(() {
                            debugPrint("Select Item $valueSelectedByUser");
                          });
                        }))),
            Container(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-z 0-9]'))
                        ],
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter the amount of principle";
                          } else if (value == "") {
                            return "Invalid number";
                          }
                        },
                        onChanged: (textValue) {
                          debugPrint(textValue);
                        },
                        controller: titleController,
                        style: theme,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            errorStyle:
                            TextStyle(color: Colors.yellow, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            label: Text("Title"),
                            hintText: "Enter title of note")))),
            Container(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                        onChanged: (textValue) {
                          debugPrint(textValue);
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-z 0-9]'))
                        ],
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter the description";
                          } else if (value == "") {
                            return "Invalid number";
                          }
                        },
                        controller: descriptionController,
                        style: theme,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            errorStyle:
                            TextStyle(color: Colors.yellow, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            label: Text("Description"),
                            hintText: "Enter Principle in e.g 12000")))),
            Row(
              children: [
                Expanded(
                    child: Container(
                        width: 250.0,
                        height: 50.0,
                        padding: pads,
                        margin: pads,
                        child: ElevatedButton (
                          onPressed: () {
                            setState(() {});
                          },
                          style: style,
                          child: const Text("Save",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w800)),
                        ))),
                Expanded(
                    child: Container(
                        width: 250.0,
                        height: 50.0,
                        padding: pads,
                        margin: pads,
                        child: ElevatedButton(
                          style: style,
                          onPressed: () => setState(() {}),
                          child: const Text("Delete",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w800)),
                        )))
              ],
            )
          ],
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
