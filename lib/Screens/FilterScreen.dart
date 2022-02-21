import 'package:flutter/material.dart';



class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white60,
            border: Border.all(color: Colors.grey)
        ),
        height:100,
        child: Padding(
          padding: const EdgeInsets.only(left: 20 , right: 20 , bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {  },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent
                ),
              child: Text('Save'),),
              OutlinedButton(onPressed: () {  },
                child: Text('Clear'),),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Hi'),
      ),
    );
  }
}
