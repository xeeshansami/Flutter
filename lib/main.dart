import 'dart:math';

import 'package:flutter/material.dart';
import './app_screens/first_screen.dart';
import 'app_screens/NoteKeeper.dart';
import 'app_screens/detail_screen.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "NotepadKeeper",
    home:  NoteKeeper(),
    theme: ThemeData(
      brightness: Brightness.dark,
        primaryColor: Colors.amberAccent, accentColor: Colors.amberAccent)));


