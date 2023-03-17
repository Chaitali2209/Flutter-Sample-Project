import 'package:flutter/material.dart';
import 'package:new_bolt/my_home.dart';
import 'package:new_bolt/color_confusion.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bolt App",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(color: Colors.black)),
      home: const MyHome(),
    );
  }
}
