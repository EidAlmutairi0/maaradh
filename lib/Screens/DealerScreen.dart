import 'package:flutter/material.dart';
import 'package:maaradh/Widgets/CarWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'FilterScreen.dart';
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
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width ,
            height: 350,
            child: Stack(
              children: [
                GridTile(
                  child: Image.network(
                    widget.image!,
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.phone_outlined , size: 30, color: Colors.blueAccent,),),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline_rounded, size: 30,color: Colors.blueAccent,),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),

                ),
                Positioned(
                  top: 50,
                  right:30,
                  height: 50,
                  width: 50,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: Icon(Icons.arrow_back, color: Colors.white,)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(                    alignment: Alignment.topLeft,


            height: 50,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: (){
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
                    children: [
                      Text("تصفية"),
                      Icon(Icons.filter_alt_outlined, size: 30,color: Colors.blueAccent,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[

                  SliverPadding(
                    padding: const EdgeInsets.all(15),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
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
                      ],
                    ),
                  ),
                ],
              ),
            )
          ),



        ],
      ),
    );
  }
}
