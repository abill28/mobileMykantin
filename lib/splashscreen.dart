// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, annotate_overrides

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
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.restaurant_menu
            ),
            SizedBox(height: 24.0),
            Text(
              "My Kantin",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
