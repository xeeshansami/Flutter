import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/Note.dart';
import 'package:flutter_app/database/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Note.dart';
import 'package:intl/intl.dart';

class details_screen extends StatefulWidget {
  var title = "";
  Note note;

  details_screen(this.title, this.note);

  @override
  State<StatefulWidget> createState() {
    return stateFullWidget(title, note);
  }
}

class stateFullWidget extends State<details_screen> {
  var title = "";
  DatabaseHelper databaseHelper = DatabaseHelper();
  Note note;

  stateFullWidget(this.title, this.note);

  @override
  void initState() {
    super.initState();
    this.note = note;
  }

  var priorities = ["High", "Low", "Medium"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.black12,
      textStyle: const TextStyle(fontSize: 30.0));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
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
    TextStyle? theme = Theme.of(context).textTheme.titleSmall;
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
                        value: updatepriorityAsString(this.note.priority),
                        onChanged: (valueSelectedByUser) {
                          setState(() {
                            debugPrint("Select Item $valueSelectedByUser");
                            updatepriorityAsInt(valueSelectedByUser.toString());
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
                          updateTitle();
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
                          updateDescription();
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
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _saveDataInDB();
                            });
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
                          onPressed: () => setState(() {
                            deleteNote(context, note);
                          }),
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
    Navigator.pop(context,true);
  }

  void updatepriorityAsInt(String value) {
    switch (value) {
      case "High":
        {
          note.priority = 1;
          break;
        }
      case "Low":
        {
          note.priority = 2;
          break;
        }
      default:
        {
          note.priority = 2;
          break;
        }
    }
  }

  String updatepriorityAsString(int value) {
    switch (value) {
      case 1:
        {
          return "High";
          break;
        }
      case 2:
        {
          return "Low";
          break;
        }
      default:
        {
          return "Low";
          break;
        }
    }
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _saveDataInDB() async {
    int result;
    moveToLastScreen();
    note.date = DateFormat.yMMMd().format(DateTime.now());
    if (note.id == null) {
      //insert note in db
      result = await databaseHelper.insertNote(note);
      if (result != 0) {
        alertMe("Congratulation", "Note Added Successfully");
      } else {
        alertMe("Error", "Something went wrong");
      }
    } else {
      //update note in db
      result = await databaseHelper.updateNote(note);
      if (result != 0) {
        alertMe("Congratulation", "Note Updated Successfully");
      } else {
        alertMe("Error", "Something went wrong");
      }
    }
  }

  void alertMe(String title, String msg) {
    var alertDialog = AlertDialog(title: Text(title), content: Text(msg));
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  void deleteNote(BuildContext context, Note note) async {
    moveToLastScreen();
    if (note.id == null) {
      alertMe("Error", "Something went wrong");
      return;
    }
    var result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      alertMe("Alert", "Note has been deleted");
    } else {
      alertMe("Error", "Something went wrong");
    }
  }
}
