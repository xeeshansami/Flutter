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
                )
              ],
            )));
  }

  int luckyNumber() {
    var random = Random();
    int luckyNumber = random.nextInt(10);
    return luckyNumber;
  }
}
