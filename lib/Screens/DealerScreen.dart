import 'package:flutter/material.dart';
import 'package:maaradh/Widgets/CarWidget.dart';

class DealerScreen extends StatefulWidget {
  const DealerScreen({Key? key}) : super(key: key);

  @override
  _DealerScreenState createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg", "لاند كروزر", "2018", "180.000", 44000)
              ],
            ),
          ),
        ),
      )
    );
  }
}
