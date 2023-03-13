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
    return Timer(duration, (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Login()));
    });
  }
  
  void initState(){
    super.initState();
    startSplashScreen();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset("assets/dd.png"),
            SizedBox(height: 24.0),
            Text(
              "Islamic App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}