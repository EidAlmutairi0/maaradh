import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maaradh/Widgets/DealerWidget.dart';
import 'package:provider/provider.dart';

import '../Providers/DearlersProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String currentDealer = "";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Dealer> dealers = [];


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

    dealers = Provider.of<DealerProvider>(context, listen: false).dealers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'المعارض',
            style: GoogleFonts.readexPro(),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFDFE5FF),
              Color(0xFFE0E6FF),
              Color(0xFFE9F0FF),
              Color(0xFFF2F4FF),
              Color(0xFFFFFFFF),
            ],
          )),
          child: SingleChildScrollView(
            child: Container(
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
                              selectedState = value.toString();
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
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            color: Colors.white,
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
                  Column(
                    children: (selectedState == null || selectedState == "الكل")
                        ? dealers
                        : dealers
                            .where((element) => element.region == selectedState)
                            .toList(),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}