// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:my_kantin/forgotpassword.dart';
import 'package:my_kantin/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView()
    );
  }
}
