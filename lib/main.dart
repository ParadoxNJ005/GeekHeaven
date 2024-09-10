import 'package:flutter/material.dart';
import 'package:geek_travel/screens/HomeScreen.dart';
import 'package:geek_travel/screens/MainTravelScreen.dart';
import 'package:geek_travel/screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

//------------------------------Media queries (mq)----------------------//
late Size mq;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: Maintravelscreen(),
    );
  }
}