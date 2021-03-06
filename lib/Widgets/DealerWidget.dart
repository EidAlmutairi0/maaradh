import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maaradh/Screens/DealerScreen.dart';
import 'package:maaradh/Screens/HomeScreen.dart';
import 'package:provider/provider.dart';

import '../Providers/LocationProvider.dart';

class Dealer extends StatefulWidget {
  String? id;
  String? image;
  String? name;
  double? lat;
  double? long;
  String? phone;
  String? location;
  double distance;
  String region;

  Dealer(this.id, this.image, this.name, this.lat, this.long, this.phone,
      this.location, this.distance, this.region,
      {Key? key});

  @override
  State<Dealer> createState() => _DealerState();
}

class _DealerState extends State<Dealer> {
  @override

  @override
  Widget build(BuildContext context) {
    var distanceProvider = Provider.of<LocationProvider>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () {
            setState(() {
              HomeScreen.currentDealer = widget.id!;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DealerScreen(widget.id, widget.image,
                      widget.name, widget.phone, widget.location)),
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
                        Text(
                          widget.distance.toStringAsFixed(1) + "km",
                          style: GoogleFonts.readexPro(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        )
                        // ignore: prefer_const_constructors
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
