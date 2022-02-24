import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maaradh/Screens/DealerScreen.dart';
import 'package:maaradh/Screens/HomeScreen.dart';

class Dealer extends StatefulWidget {
  String? image;
  String? name;
  double? distance;
  Dealer(String image, String name, double distance, {Key? key})
      : super(key: key) {
    this.image = image;
    this.name = name;
    this.distance = distance;
  }

  @override
  State<Dealer> createState() => _DealerState();
}

class _DealerState extends State<Dealer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () {
            setState(() {
              HomeScreen.currentDealer = widget.name!;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DealerScreen(widget.image, widget.name, widget.distance)),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 3))
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            width: MediaQuery.of(context).size.width - 70,
            height: 270,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GridTile(
                child: Image.network(
                  widget.image!,
                  fit: BoxFit.cover,
                ),
                footer: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name!,
                          style: GoogleFonts.readexPro(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        // ignore: prefer_const_constructors
                        Text(
                          "${widget.distance.toString()}km",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
