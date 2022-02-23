import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DealerScreen.dart';
import '../Widgets/FilterElements.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> carBrand = [
    "تايوتا",
    "شفرولية",
    "نيسان",
    "فورد",
    "مرسيدس",
    "GMC",
    "هونداي",
    "هوندا",
    "BMW"
  ];
  GroupButtonController brandsGroupButtonController = GroupButtonController();
  void selectedButtons() {
    for (CarBrand brand in DealerScreen.savedCarBRands) {
      int i = brand.index!;
      brandsGroupButtonController.selectedIndexes.add(i);
    }
    if (DealerScreen.selectedState != "لم يحدد") {
      selectedState = DealerScreen.selectedState;
    }

    if (DealerScreen.selectedYear != "1800") {
      selectedYear = DealerScreen.selectedYear;
    }
  }

  String? selectedState;
  List<String> states = [
    'أي',
    'جديد',
    'مستعمل',
  ];
  void getYears() {
    for (int i = 30; i >= 0; i--) {
      yesrs.add(DateTime(DateTime.now().year - i, 1).year.toString());
    }
  }

  String? selectedYear;
  List<String> yesrs = [];

  DateTime selectedDate = DateTime(DateTime.now().year + 2, 1);
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: Container(
            // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              currentDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 50, 1),
              lastDate: DateTime(DateTime.now().year + 1, 1),
              initialDate: DateTime.now(),
              // save the selected date to _selectedDate DateTime variable.
              // It's used to set the previous selected date when
              // re-showing the dialog.
              selectedDate: selectedDate,
              onChanged: (DateTime dateTime) {
                // close the dialog when year is selected.
                Navigator.pop(context);
                setState(() {
                  selectedDate = dateTime;
                });

                // Do something with the dateTime selected.
                // Remember that you need to use dateTime.year to get the year
              },
            ),
          ),
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    selectedButtons();
    getYears();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white60,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                child: Text('Save'),
              ),
              OutlinedButton(
                child: const Text(
                  'Clear',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                onPressed: () {
                  brandsGroupButtonController.unselectAll();
                  setState(() {
                    selectedDate = DateTime(DateTime.now().year + 2, 1);
                    selectedState = null;
                    selectedYear = null;
                    DealerScreen.selectedState = "لم يحدد";
                    DealerScreen.selectedYear = "1800";
                    DealerScreen.savedCarBRands = [];
                  });
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'الشركة:',
                  style: GoogleFonts.readexPro(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),
              Center(
                child: GroupButton(
                  controller: brandsGroupButtonController,
                  isRadio: false,
                  onSelected: (index, isSelected) {
                    if (!isSelected) {
                      DealerScreen.savedCarBRands.remove(index);
                      print('$index button is removed');
                    } else {
                      DealerScreen.savedCarBRands
                          .add(CarBrand(carBrand[index], index));
                      print('$index button is add');
                    }
                    for (CarBrand brand in DealerScreen.savedCarBRands) {
                      print(carBrand[brand.index!]);
                    }
                  },
                  buttons: carBrand,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'السنة:',
                      style: GoogleFonts.readexPro(
                          fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                                  'اختر',
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
                          items: yesrs
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
                          value: selectedYear,
                          onChanged: (value) {
                            setState(() {
                              selectedYear = value as String;
                              DealerScreen.selectedYear = value;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black54,
                          iconDisabledColor: Colors.black54,
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
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'الحالة:',
                      style: GoogleFonts.readexPro(
                          fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                                  'اختر',
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
                              DealerScreen.selectedState = value;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black54,
                          iconDisabledColor: Colors.black54,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
