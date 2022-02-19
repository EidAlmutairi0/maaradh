// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maaradh/Widgets/DealerWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'الرئيسية',
            style: GoogleFonts.readexPro(),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Dealer(
                    'https://bramjnaa.com/wp-content/uploads/saleh-cars-showroomunnamed-1200x675.jpg',
                    'معرض صالح',
                    4.1),
                Dealer(
                    'https://almaaridnow.com.sa/wp-content/uploads/2019/04/P1020178.jpg',
                    'معرض كلاس',
                    4.3)
              ],
            ),
          ),
        ));
  }
}
