import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';  
import 'package:flutter/material.dart';
import 'package:my_kantin/dashboard.dart';
import 'package:my_kantin/requestBarang.dart';
import 'package:my_kantin/transaksiH.dart';

class HalPage extends StatefulWidget {
  HalPage({required this.hal});
  final hal;
  @override
  State<HalPage> createState() => _HalPageState();
}

class _HalPageState extends State<HalPage> {
  int _selectedNavbar = 2;
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  List _screens = [requestBarang(), Dashboard(), Transaksi(),];

  @override
  void initState() {
    // TODO: implement initState

    if (widget.hal != 0) {
      setState(() {
        _selectedNavbar = widget.hal;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit an App'),
              actions: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20 / 2,
                      bottom: 20 / 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20 / 2),
                      color: Color(0xff28316A),
                    ),
                    child: Text(
                      "NO",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () => exit(0),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20 / 2,
                      bottom: 20 / 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20 / 2),
                      color: Color(0xffEF5227),
                    ),
                    child: Text(
                      "YES",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
          return Future.value(true);
        },
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            color: Color(0xff28316A),
            backgroundColor: Color(0xffF0EEEE).withOpacity(0.0),
            buttonBackgroundColor: Color(0xff00817f),
            height: 60,
            items: <Widget>[
              Icon(Icons.add_shopping_cart_outlined , size: 30,color: Colors.white,),
              Icon(Icons.home, size: 30,color: Colors.white,),
              Icon(Icons.auto_stories_outlined, size: 30,color: Colors.white,),
              
            ],
            index: _selectedNavbar,
            onTap: _changeSelectedNavBar,
          ),
          body: _screens[_selectedNavbar],
        )
      );
  }
}
