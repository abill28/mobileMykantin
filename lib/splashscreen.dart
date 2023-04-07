// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, annotate_overrides, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_kantin/login.dart';

class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenView createState() => _SplashScreenView();
}

class _SplashScreenView extends State<SplashScreenView> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    });
  }

  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: 
      Container(child:
      Image.asset("assets/images/mykantin.jpg")),
      ),
    );
  }
}
