import 'package:flutter_app/utils/Constants.dart';

class Note {
  late int _id;
  late String _title;
  late String _description;
  late String _date;
  late int _priority;

  Note(this._title, this._date, this._priority,[_description]);

  Note.withId(this._title, this._date, this._priority,[_description]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  String get date => _date;

  int get priority => _priority;

  set title(String title) {
    if (title.length <= 255) {
      this._title = title;
    }
  }

  set description(String description) {
    if (description.length <= 255) {
      this._description = description;
    }
  }

  set date(String date) {
    this._date = date;
  }

  set priority(int priority) {
    if (priority >= 1 && priority >= 2) {
      this._priority = priority;
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (_id == null) {
      map[Constants.id] = _id;
    }
    map[Constants.title] = _title;
    map[Constants.description] = _description;
    map[Constants.date] = _date;
    map[Constants.priority] = _priority;
    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map[Constants.id];
    this.title = map[Constants.title];
    this._description = map[Constants.description];
    this._date = map[Constants.date];
    this._priority = map[Constants.priority];
  }
}
