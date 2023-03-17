// ignore: file_names
// ignore: file_names
// ignore: file_names

import 'dart:async';

import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class disWordGame extends StatefulWidget {
  disWordGame({Key? key, required this.response, required this.index})
      : super(key: key);

  int index;
  List<dynamic> response;

  @override
  State<disWordGame> createState() => _disWordGameState();
}

// ignore: camel_case_types
class _disWordGameState extends State<disWordGame> {
  List<dynamic> response = [];
  List<dynamic> listdesc = [];
  int rank = 0;
  int i = 0;
  late String word;
  int sec = 1000;
  bool isactive = false;

  Timer _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {});

  @override
  void initState() {
    response = widget.response;
    rank = widget.index;
    word = response[rank]['description'];

    listdesc = word.split(' ');
    listdesc.add("***End***");

    super.initState();
  }

  // ignore: non_constant_identifier_names
  void Start_timer() {
    _timer = Timer.periodic(Duration(milliseconds: sec), (timer) {
      setState(() {
        if (i < listdesc.length - 1 && i > -1) {
          i = i + 1;
        } else {
          isactive = false;

          _timer.cancel();
        }
      });
    });
  }

  // ignore: non_constant_identifier_names
  void increase_timer() {
    setState(() {
      if (sec < 1500) {
        isactive = false;
        _timer.cancel();
        i = 0;
        sec += 500;
      } else {
        isactive = false;
        _timer.cancel();
        i = 0;
        sec = 1500;
      }
    });
  }

  // ignore: non_constant_identifier_names
  void decrease_timer() {
    setState(() {
      if (sec > 500) {
        isactive = false;
        _timer.cancel();
        i = 0;
        sec -= 500;
      } else {
        isactive = false;
        _timer.cancel();
        i = 0;
        sec = 500;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Word Game - Enhance your Eye Fixation!🔥"),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: Colors.grey,
            ),
            margin: const EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 0.0),
            padding: const EdgeInsets.all(4.0),
            child: Center(
                child: Text(
              listdesc[i],
              style: TextStyle(color: Colors.white, fontSize: 41, shadows: [
                Shadow(
                    color: Colors.white.withOpacity(0.4),
                    offset: const Offset(15, 12),
                    blurRadius: 15)
              ]),
            )),
          ),
          Container(
            height: 50,
            width: double.infinity,
            // margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(3.0),
            child: Center(
                child: Text(
              "You are reading at a speed of 1 word per $sec milliseconds",
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            )),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: (() => increase_timer()),
                      child: const Center(
                          child: Text(
                        "-1X",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueGrey,
                    ),
                    child: GestureDetector(
                      child: Center(
                          child: isactive
                              ? const Icon(Icons.pause_circle_rounded)
                              : const Icon(Icons.play_arrow_rounded)),
                      onTap: () {
                        if (isactive == true) {
                          _timer.cancel();
                        } else {
                          Start_timer();
                        }

                        setState(() {
                          if (listdesc.length == i + 1) {
                            i = 0;
                            _timer.cancel();
                            Start_timer();
                          }
                          if (isactive == false) {
                            isactive = true;
                          } else {
                            isactive = false;
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueGrey,
                    ),
                    child: GestureDetector(
                      onTap: () => decrease_timer(),
                      child: const Center(
                          child: Text(
                        "1X",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
