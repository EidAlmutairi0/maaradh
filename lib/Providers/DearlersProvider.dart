import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Widgets/DealerWidget.dart';
import 'LocationProvider.dart';

class DealerProvider with ChangeNotifier {
  List<Dealer> dealers = [];

  Future getDealers(context) async {
    dealers = [];
    http.Response response =
        await http.get(Uri.parse("http://localhost:4000/buyer/dealers"));
    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        throw Error();
      }
      Map<String, dynamic> data = await jsonDecode(response.body);
      List<dynamic> temp = await data['dealers'];

      for (int i = 0; i < temp.length; i++) {
        Dealer dealer = Dealer(
            temp[i]['_id'],
            "http://localhost:4000/" + temp[i]['imageUrl'],
            temp[i]['name'],
            temp[i]['lat'],
            temp[i]['long'],
            temp[i]['phone'],
            temp[i]['location'],
            Geolocator.distanceBetween(
                    Provider.of<LocationProvider>(context, listen: false).lat,
                    Provider.of<LocationProvider>(context, listen: false).long,
                    temp[i]['lat'],
                    temp[i]['long']) /
                1000,
            temp[i]['region']);
        dealers.add(dealer);
      }

      dealers.sort((a, b) => a.distance.compareTo(b.distance));
      notifyListeners();
      return;
    } else {
      throw Error();
    }
  }
}
