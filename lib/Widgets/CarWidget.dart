import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Car extends StatelessWidget {
  String? image;
  String? name;
  String? year;
  String? price;
  String? mileage;
  String? brand;

  Car(String image, String name, String year, String price, String mileage,
      String brand) {
    this.image = image;
    this.name = name;
    this.year = year;
    this.price = price;
    this.mileage = mileage;
    this.brand = brand;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {},
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              child: Image.network(
                image!,
                fit: BoxFit.cover,
              ),
              footer: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    children: [
                                      Text(
                                        "?????????????? : ",
                                        style: GoogleFonts.readexPro(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        name!,
                                        style: GoogleFonts.readexPro(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    children: [
                                      Text(
                                        "???????????? : ",
                                        style: GoogleFonts.readexPro(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        mileage.toString(),
                                        style: GoogleFonts.readexPro(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    children: [
                                      Text(
                                        "?????????? : ",
                                        style: GoogleFonts.readexPro(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        year!,
                                        style: GoogleFonts.readexPro(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),

                                // ignore: prefer_const_constructors
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    children: [
                                      Text(
                                        "?????????? : ",
                                        style: GoogleFonts.readexPro(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        price!,
                                        style: GoogleFonts.readexPro(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          flex: 2,
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
