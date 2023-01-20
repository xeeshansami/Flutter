import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/detail_screen.dart';
import 'package:flutter_app/database/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Note.dart';

class NoteKeeper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return notePadKeeperState();
  }
}

class notePadKeeperState extends State<NoteKeeper> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note>? noteList;
  var count = 0;

  @override
  void initState() {
    super.initState();
    if (noteList == null) {
      noteList = <Note>[];
      updateListOfNote();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notepads")),
      body: getNotepadList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("click");
          navigateToNextScreen(Note("", "", 2), "Add Note");
        },
        tooltip: "Add new note",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNotepadList() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor:
                      getPriority(this.noteList![position].priority),
                  child: getPriorityIcons(this.noteList![position].priority)),
              title: Text("${this.noteList![position].title}",
                  style: TextStyle(color: Colors.black)),
              subtitle: Text(
                "${this.noteList![position].date}",
                style: TextStyle(color: Colors.black),
              ),
              trailing: GestureDetector(
                child: Icon(Icons.delete, color: Colors.grey),
                onTap: () {
                  deleteNote(context, this.noteList![position]);
                },
              ),
              onTap: () {
                navigateToNextScreen(this.noteList![position], "Edit Note");
              },
            ),
          );
        });
  }

  void navigateToNextScreen(Note note, String noteTitle) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return details_screen(noteTitle, note);
    }));
    if (result == true) {
      updateListOfNote();
    }
  }

  Color getPriority(int pri0rity) {
    switch (pri0rity) {
      case 1:
        {
          return Colors.red;
          break;
        }
      case 2:
        {
          return Colors.yellow;
          break;
        }
      default:
        return Colors.yellow;
    }
  }

  Icon getPriorityIcons(int pri0rity) {
    switch (pri0rity) {
      case 1:
        {
          return Icon(Icons.play_arrow);
          break;
        }
      case 2:
        {
          return Icon(Icons.keyboard_arrow_right);
          break;
        }
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void deleteNote(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, "Note Successfully deleted");
      updateListOfNote();
    }
  }

  void _showSnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void updateListOfNote() {
    final Future<Database> dbFuture = databaseHelper.initialisedDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
