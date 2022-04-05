// ignore: file_names
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'MainScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maaradh/Widgets/DealerWidget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String currentDealer = "";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Dealer> dealers = [];
  
  Future getDealers() async{
    http.Response response = await http.get(Uri.parse("http://localhost:4000/buyer/dealers"));
    if (response.statusCode == 200) {
      if(response.body.isEmpty){
        throw Error();
      }
      Map<String, dynamic> data = jsonDecode(response.body);





      for(int i = 0; i<=data.length; i++){
        Dealer dealer = Dealer(data['dealers'][i]['_id'], "http://localhost:4000/" + data['dealers'][i]['imageUrl'], data['dealers'][i]['name'], data['dealers'][i]['lat'], data['dealers'][i]['long'], data['dealers'][i]['phone'], data['dealers'][i]['location']);
        dealers.add(dealer);
      }

    } else {
      throw Error();

    }


  }



  String? selectedState;
  List<String> states = [
    'الكل',
    'الرياض',
    'القصيم',
    'الشرقية',
    'مكة المكرمة',
    'المدينة المنورة',
    'تبوك',
    'عسير',
    'حائل',
    'الحدود الشمالية',
  ];

  @override
  void initState() {
    super.initState();
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'المعارض',
            style: GoogleFonts.readexPro(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'المنطقة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: states
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedState,
                      onChanged: (value) {
                        setState(() {
                          selectedState = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black54,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                builder: (ctx, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasError){
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.done){
                    return Column(
                      children: dealers,
                    );
                  }
                  return Column(
                    children: dealers,
                  );
                },
                future: getDealers(),
              ),


            ],
          ),
        ));
  }
}
