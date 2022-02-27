import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maaradh/Widgets/CarWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../Providers/CarsProvider.dart';
import 'FilterScreen.dart';
import '../Widgets/FilterElements.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DealerScreen extends StatefulWidget {
  String? id;
  String? image;
  String? name;
  double? distance;
  static List<CarBrand> savedCarBRands = [];
  static String selectedYear = "1800";

  // ignore: use_key_in_widget_constructors
  DealerScreen(this.id, this.image, this.name, this.distance, {Key? key});

  @override
  _DealerScreenState createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
  List<Car>? filter(List<Car> cars , context) {
    var carProv = Provider.of<CarsProvider>(context);
    List<Car> tempList = [];
    if (carProv.savedCarBRands.isNotEmpty) {
      for (Car car in cars) {
        for (int i = 0; i < carProv.savedCarBRands.length; i++) {
          if (carProv.savedCarBRands[i].brandName == car.brand) {
            tempList.add(car);
          }
        }
        // ignore: iterable_contains_unrelated_type

      }
    } else {
      return cars;
    }
    return tempList;
  }

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  @override

  @override
  Widget build(BuildContext context) {
    var carProv = Provider.of<CarsProvider>(context);
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
                fit: BoxFit.cover,
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
                              icon: const Icon(
                                Icons.phone_outlined,
                                size: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mail_outline_rounded,
                                size: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
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
                const Divider(),
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
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: StreamBuilder<QuerySnapshot>(
                    stream: (carProv.selectedYear == "1800")
                        ? _firebaseFirestore
                            .collection('Dealers')
                            .doc(widget.id)
                            .collection("Cars")
                            .snapshots()
                        : _firebaseFirestore
                            .collection('Dealers')
                            .doc(widget.id)
                            .collection("Cars")
                            .where("Year", isEqualTo: carProv.selectedYear)
                            .snapshots(),
                    builder: (context, snapshot) {
                      List<Car> cars = [];

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError || snapshot.data!.docs.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("لا يوجد سيارات"),
                        );
                      }
                      for (var car in snapshot.data!.docs) {
                        Car temp = Car(
                            car.get("image"),
                            car.get("Name"),
                            car.get("Year"),
                            car.get("Price"),
                            car.get("Mileage"),
                            car.get("brand"));
                        cars.add(temp);
                      }

                      cars = filter(cars , context)!;

                      return GridView.count(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: cars,
                      );
                    }),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
