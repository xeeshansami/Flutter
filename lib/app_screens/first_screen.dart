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
        child: Text("Your lucky number is " + luckyNumber().toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 15.0)));
  }

  int luckyNumber() {
    var random = new Random();
    int luckyNumber = random.nextInt(10);
    return luckyNumber;
  }
}
