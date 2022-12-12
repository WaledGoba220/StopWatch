import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({Key? key}) : super(key: key);

  static const route = "/stopwatch";

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final labs = <int>[];

  int milliseconds = 0;
  int seconds = 0;
  double itemHeight = 60;
  Timer? timer;

  bool isRunning = false;
  final scoreController = ScrollController();

  void startTimer() {
    print("Start, Done");

    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        milliseconds += 100;
        print(milliseconds);
        setState(() {
          isRunning = true;
        });
      },
    );
  }

  void lap() {
    setState(() {
      labs.add(milliseconds);
      milliseconds = 0;
    });
    scoreController.animateTo(
      itemHeight * labs.length,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    print("Lap, Done");
  }

  void stopTimer() {
    if (isRunning) {
      timer!.cancel();
      setState(() {
        isRunning = false;
      });
    }
    print("Stop, Done");
  }

  String secondText(int millis) {
    final sec = millis / 1000;
    return "$sec";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StopWatch"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Lap ${labs.length + 1}",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "${secondText(milliseconds)} Seconds",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: isRunning ? null : startTimer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text("Start"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: isRunning ? lap : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                        child: const Text("Lap"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: isRunning ? stopTimer : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("Stop"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                  itemExtent: itemHeight,
                  itemCount: labs.length,
                  controller: scoreController,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 50),
                      title: Text("Lap ${index + 1}"),
                      trailing: Text("${secondText(labs[index])} Seconds"),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
