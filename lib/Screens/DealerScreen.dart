import 'package:flutter/material.dart';
import 'package:maaradh/Widgets/CarWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class DealerScreen extends StatefulWidget {
  String? image;
  String? name;
  double? distance;

  // ignore: use_key_in_widget_constructors
  DealerScreen(this.image, this.name, this.distance, {Key? key});

  @override
  _DealerScreenState createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Column(
        children: [
          GridTile(
            header: Container(
              height: 20,
              width: 20,
              color: Colors.blueAccent,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
              ),
            ),
            footer: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.name!,
                            style: GoogleFonts.readexPro(
                                fontSize: 22, fontWeight: FontWeight.w300),
                          ),
                          // ignore: prefer_const_constructors
                          Text(
                            "${widget.distance.toString()}km",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.phone_outlined,
                              size: 35,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mail_outlined,
                              size: 35,
                              color: Colors.blueAccent,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: Image.network(
              widget.image!,
              fit: BoxFit.cover,
            ),
          ),
          Car("https://cdn.motor1.com/images/mgl/6LWeG/s1/eksterer-toyota-land-cruiser-300.jpg",
              "لاند كروزر", "2018", "180.000", 44000),
        ],
      ),
    );
  }
}
