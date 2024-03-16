import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Dice')),
        backgroundColor: Colors.red.shade500,
      ),
      body: const SafeArea(child: DicePage()),
      backgroundColor: Colors.red.shade700,
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;
  int counter = 0;
  bool startGame = false;

  int generateNumber() {
    return Random().nextInt(6) + 1;
  }

  void getDiceFace() {
    setState(() {
      if (leftDiceNumber == rightDiceNumber) {
        counter = 1;
        leftDiceNumber = generateNumber();
        rightDiceNumber = generateNumber();
      } else {
        leftDiceNumber = generateNumber();
        rightDiceNumber = generateNumber();
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (startGame == false)
          ? Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    startGame = true;
                    print('start button pressed');
                  });
                },
                style:
                    TextButton.styleFrom(backgroundColor: Colors.red.shade500),
                child: Text(
                  "Let's start",
                  style: TextStyle(
                    backgroundColor: Colors.red.shade500,
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: Colors.red.shade500,
                          ),
                          onPressed: () {
                            getDiceFace();
                          },
                          child: Image.asset('images/dice$leftDiceNumber.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: Colors.red.shade500,
                          ),
                          onPressed: () {
                            getDiceFace();
                          },
                          child: Image.asset('images/dice$rightDiceNumber.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                if (counter != 0 && leftDiceNumber == rightDiceNumber) ...[
                  const Text(
                    'You Won!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Trials: $counter',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade500),
                    onPressed: () {
                      setState(() {
                        counter = 0;
                        leftDiceNumber = generateNumber();
                        rightDiceNumber = generateNumber();
                      });
                    },
                    child: const Text(
                      'Start again',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
