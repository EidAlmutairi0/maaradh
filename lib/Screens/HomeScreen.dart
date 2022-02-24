// ignore_for_file: file_names
import 'package:flutter/material.dart';
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
              Dealer(
                  'https://almaaridnow.com.sa/wp-content/uploads/2019/05/%D9%A2%D9%A0%D9%A1%D9%A9%D9%A0%D9%A5%D9%A0%D9%A2_%D9%A2%D9%A0%D9%A2%D9%A4%D9%A4%D9%A1.jpg',
                  'معرض العُمَر',
                  4.1),
              Dealer(
                  'https://bramjnaa.com/wp-content/uploads/saleh-cars-showroomunnamed-1200x675.jpg',
                  'معرض صالح',
                  4.2),
              Dealer(
                  'https://almaaridnow.com.sa/wp-content/uploads/2019/04/P1020178.jpg',
                  'معرض كلاس',
                  4.3),
            ],
          ),
        ));
  }
}
