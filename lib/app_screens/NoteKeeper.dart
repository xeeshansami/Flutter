import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/detail_screen.dart';

class NoteKeeper extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return notePadKeeperState();
  }
}

class notePadKeeperState extends State<NoteKeeper> {
  int count = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notepads")),
      body: getNotepadList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToNextScreen("Add Note");
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
                  backgroundColor: Colors.yellow,
                  child: Icon(Icons.keyboard_arrow_right)),
              title: Text("Dummy Title", style: TextStyle(color: Colors.black)),
              subtitle: Text(
                "Dummy Subtitle",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(Icons.delete, color: Colors.grey),
              onTap: () {
                navigateToNextScreen("Edit Note");
              },
            ),
          );
        });
  }

  void navigateToNextScreen(String noteTitle){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return details_screen(noteTitle);
    }));
  }
}
