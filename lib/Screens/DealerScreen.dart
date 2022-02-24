import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maaradh/Widgets/CarWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'FilterScreen.dart';
import '../Widgets/FilterElements.dart';

class DealerScreen extends StatefulWidget {
  String? image;
  String? name;
  double? distance;
  static List<CarBrand> savedCarBRands = [];
  static String selectedYear = "1800";
  static String selectedState = "لم يحدد";

  // ignore: use_key_in_widget_constructors
  DealerScreen(this.image, this.name, this.distance, {Key? key});

  @override
  _DealerScreenState createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                widget.name!,
                style: GoogleFonts.readexPro(
                    fontSize: 14, fontWeight: FontWeight.w300),
              ),
              background: Image.network(
                widget.image!,
                fit: BoxFit.fitWidth,
              ),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.305,
          ),
          SliverPadding(
            padding: EdgeInsets.all(5),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.phone_outlined,
                                size: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mail_outline_rounded,
                                size: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.map_outlined,
                                size: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        showCupertinoModalBottomSheet(
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (context) => FilterScreen(),
                        );
                      },
                      child: Container(
                        width: 70,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: const [
                            Text("تصفية"),
                            Icon(
                              Icons.filter_alt_outlined,
                              size: 30,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              children: <Widget>[
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
                Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
                    "لاند كروزر", "2018", "180.000", 44000),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
