import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';



class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
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
                child: Text('Save' ),),
                OutlinedButton(onPressed: () {  },
                  child: const Text('Clear' , style: TextStyle(
                    color: Colors.blueGrey
                  ),),),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white60,
          centerTitle: false,
          automaticallyImplyLeading: false,

          title: Container(

            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close' , style: TextStyle(
                  color: Colors.blueAccent
              )),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.red,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
