// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:maaradh/Screens/DealerScreen.dart';
import 'package:provider/provider.dart';

import '../Providers/DearlersProvider.dart';
import '../Providers/LocationProvider.dart';
import '../Widgets/DealerWidget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> marker = [];
  List<Marker> markers = [];

  void _modalBottomSheetMenu(Dealer dealer) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DealerScreen(dealer.id, dealer.image,
                        dealer.name, dealer.phone, dealer.location)),
              );
            },
            child: Card(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: GridTile(
                    child: Image.network(
                      dealer.image!,
                      fit: BoxFit.cover,
                    ),
                    footer: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Center(
                        child: Text(
                          dealer.name!,
                          style: GoogleFonts.readexPro(
                              fontSize: 30, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void getMarkers() {
    marker.add(Marker(
      width: 80.0,
      height: 80.0,
      point: latLng.LatLng(
          Provider.of<LocationProvider>(context, listen: false).lat,
          Provider.of<LocationProvider>(context, listen: false).long),
      builder: (ctx) => Container(
        child: const Icon(
          Icons.my_location,
          color: Colors.blueGrey,
        ),
      ),
    ));
    for (Dealer dealer
        in Provider.of<DealerProvider>(context, listen: false).dealers) {
      markers.add(Marker(
        point: latLng.LatLng(dealer.lat!, dealer.long!),
        builder: (ctx) => Container(
          child: IconButton(
            icon: const Icon(
              Icons.car_repair_outlined,
              size: 30,
            ),
            onPressed: () {
              _modalBottomSheetMenu(dealer);
            },
          ),
        ),
      ));
    }
  }

  void initState() {
    getMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<DealerProvider>(context, listen: true).dealers);

    return FlutterMap(
      options: MapOptions(
        plugins: [
          MarkerClusterPlugin(),
        ],
        center: latLng.LatLng(
            Provider.of<LocationProvider>(context, listen: false).lat,
            Provider.of<LocationProvider>(context, listen: false).long),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return Text("© OpenStreetMap contributors");
          },
        ),
        MarkerClusterLayerOptions(
          maxClusterRadius: 120,
          size: Size(40, 40),
          fitBoundsOptions: FitBoundsOptions(
            padding: EdgeInsets.all(50),
          ),
          markers: markers,
          polygonOptions: PolygonOptions(
              borderColor: Colors.blueAccent,
              color: Colors.black12,
              borderStrokeWidth: 3),
          builder: (context, markers) {
            return FloatingActionButton(
              child: Text(markers.length.toString()),
              onPressed: null,
            );
          },
        ),
        MarkerLayerOptions(
          markers: marker,
        ),
      ],
    );
  }
}
