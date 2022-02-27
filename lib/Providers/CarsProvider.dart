import 'package:flutter/material.dart';
import '../Widgets/FilterElements.dart';

class CarsProvider with ChangeNotifier {

   List<CarBrand> savedCarBRands = [];
   String selectedYear = "1800";

  void addToBrands(CarBrand car){
    savedCarBRands.add(car);
    notifyListeners();
  }

  void changeYear(String year){
    selectedYear = year;
    notifyListeners();
  }

  void resetBrans(){
    savedCarBRands = [];
    notifyListeners();

  }

  void resetYear(){
    selectedYear = "1800";
    notifyListeners();

  }

  void removeBrand(int index){
    savedCarBRands.removeAt(index);
  }

}