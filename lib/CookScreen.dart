import 'dart:async';

import 'package:flutter/material.dart';

class CookScreen extends StatefulWidget {
  int time;
  String Image;
  String DishName;
  int Cal;
  String Ingredients;
  String Recipe;
  CookScreen({
    required this.time,
    required this.DishName,
    required this.Cal,
    required this.Ingredients,
    required this.Recipe,
    required this.Image,
  });
  @override
  State<StatefulWidget> createState() {
    return _CookScreenState(
        Image: Image,
        seconds: time,
        DishName: DishName,
        Cal: Cal,
        Ingredients: Ingredients,
        Recipe: Recipe);
  }
}

IconData _icon = Icons.play_circle_fill;

class _CookScreenState extends State<CookScreen> {
  int seconds;
  String Image;
  String DishName;
  int Cal;
  String Ingredients;
  String Recipe;

  //timer part
  late int tempTime;
  Timer? timer;
  bool flag = true;
  int count = 0;
  _CookScreenState({
    required this.seconds,
    required this.DishName,
    required this.Cal,
    required this.Ingredients,
    required this.Recipe,
    required this.Image,
  }) {
    tempTime = seconds;
  }

  void startTimer() {
    if (timer != null) {
      timer!.cancel(); // Cancel the existing timer if there is one
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (tempTime > 0) {
          tempTime--;
        } else {
          timer!.cancel();
          tempTime = seconds; // Stop the timer when tempTime reaches 0
        }
      });
    });
  }

  void pauseTimer() {
    timer?.cancel();
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')} to cook';
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: w,
          height: h,
          //color: Colors.white,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: w,
                        height: h / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(Image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: h / 2.70,
                        child: Container(
                          width: w,
                          height: h / 25,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 20,
                      ),
                      Text(
                        DishName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 20,
                      ),
                      Text(
                        '$Cal cal',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 20,
                      ),
                      Text(
                        'Ingredients',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Text(
                      Ingredients,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: h / 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 20,
                      ),
                      Text(
                        'Recipe',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          Recipe,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              Positioned(
                top: h / 17,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.7),
                      shape: CircleBorder(),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                top: h - h / 14,
                left: 30,
                child: SizedBox(
                  width: w - 60,
                  height: h / 15,
                  child: ElevatedButton(
                      onPressed: () {
                        if (count == 0 || tempTime == 0) {
                          tempTime = seconds;
                          count++;
                        }
                        if (flag == true) {
                          startTimer();

                          setState(() {
                            _icon = Icons.pause_circle;
                          });
                          flag = false;
                        } else {
                          pauseTimer();
                          setState(() {
                            _icon = Icons.play_circle_fill;
                          });
                          flag = true;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _icon,
                            color: Colors.white,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              formatTime(
                                  tempTime), // Display timer in HH:MM:SS format
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
