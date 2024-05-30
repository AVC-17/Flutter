import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultsPage extends StatelessWidget {
  final String resultText;
  final String interpretation;
  final String result;
  ResultsPage(
      {required this.result,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Calulator"),
        ),
        body: Center(
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
            color: const Color(0xFF111328),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result.toString(),
                    style: const TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    resultText,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    interpretation,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
