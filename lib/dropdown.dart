import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: DropdownButton<String>(
        value: _chosenValue,
        //elevation: 5,
        style: TextStyle(color: Colors.black),

        items: <String>[
          'Male',
          'Female',
          'haha',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          "Select",
          style: TextStyle(
              color: Colors.grey ),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
          });
        },
      ),
    );
  }
}
