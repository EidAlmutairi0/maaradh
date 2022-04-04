import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maaradh/Widgets/CarWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../Providers/CarsProvider.dart';
import 'FilterScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class DealerScreen extends StatefulWidget {
  String? id;
  String? image;
  String? name;
  double? distance;
  String? phone;
  String? location;

  // ignore: use_key_in_widget_constructors
  DealerScreen(this.id, this.image, this.name,  this.phone ,this.location, {Key? key});

  @override
  _DealerScreenState createState() => _DealerScreenState();
}

void _launchURL(String url) async {
  final String encodedURl = Uri.encodeFull(url);
  await launch(encodedURl);
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
                              onPressed: () {
                                _launchURL("tel:${widget.phone}");
                              },
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
                              onPressed: () {
                                _launchURL(widget.location!);
                              },
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

              ),
            ]),
          ),
        ],
      ),
    );
  }
}
