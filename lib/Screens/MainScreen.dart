// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'MapScreen.dart';
import 'HomeScreen.dart';
import 'MessagesScreen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:provider/provider.dart';

import '../Providers/LocationProvider.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 1;
  List pages = [MapScreen(), HomeScreen(), MessagesScreen()];

  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false).determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
