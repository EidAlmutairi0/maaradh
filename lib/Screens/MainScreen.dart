// ignore_for_file: file_names

import 'dart:async';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/LocationProvider.dart';
import 'HomeScreen.dart';
import 'MapScreen.dart';
import 'MessagesScreen.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool delay = true;

  void timer() {
    Timer _timer;
    _timer = Timer(const Duration(seconds: 1), () {
      setState(() {
        delay = false;
      });
    });
  }

  int pageIndex = 1;
  List pages = [MapScreen(), HomeScreen(), MessagesScreen()];

  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false).determinePosition();
    timer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (delay) ?  Container(

      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      color:  Colors.blue,
    ):Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.map),
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.chat),
        ],
        initialActiveIndex: 1, //optional, default as 0
        onTap: (int i) {
          setState(() {
            pageIndex = i;
          });
        },
      ),
      body: pages[pageIndex],
    );
  }
}
