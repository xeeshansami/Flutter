import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text("First App"),
          backgroundColor: Colors.red,
        ),
            body: const Center(
              child: Image(
                image: AssetImage('assets/images/abc.jpg'),
              ),
            ),
      )),
    );
