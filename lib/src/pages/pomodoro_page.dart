import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  double percent = 0;
  static int TimeInMinut = 25;
  int TimeInSec = TimeInMinut * 60;
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1542bf), Color(0xff51a8ff)],
              begin: FractionalOffset(0.5, 1),
            ),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Pomodoro Clock",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                  ),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 120,
                  lineWidth: 20.0,
                  progressColor: Colors.white,
                  center: Text(
                    "$TimeInMinut",
                    style: const TextStyle(color: Colors.white, fontSize: 80),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      "Studt Timer",
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "25",
                                      style: TextStyle(
                                        fontSize: 80.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      "Pause Time",
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                        fontSize: 80.0,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 28.0),
                          child: ElevatedButton(
                              onPressed: () {
                                TimeInMinut = 25;
                                int Time = TimeInMinut * 60;
                                double secPercent = (Time / 100);
                                timer = Timer.periodic(Duration(seconds: 1),
                                    (timer) {
                                  // print(timer);
                                  //print(Time);
                                  print(percent);
                                  setState(() {
                                    if (Time > 0) {
                                      Time--;
                                      if (Time % 60 == 0) {
                                        TimeInMinut--;
                                      }
                                      if (Time % secPercent == 0) {
                                        if (percent < 1) {
                                          percent += 0.01;
                                        } else {
                                          percent = 1;
                                        }
                                      }
                                    } else {
                                      percent = 0;
                                      TimeInMinut = 25;
                                      timer.cancel();
                                    }
                                  });
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "Start studying",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
