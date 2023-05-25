import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';

class TestDropDown extends StatefulWidget {
  const TestDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<TestDropDown> createState() => _TestDropDownState();
}

class _TestDropDownState extends State<TestDropDown> {
  List<String> dataString = [
    "Umar Farooq",
    "Dr Naseer",
    "Dr Munir",
    "Saeed Watto",
  ];
  String? selectedString;
  List<String>? selectedDataString;

  @override
  Widget build(BuildContext context) {
    return CustomMultiSelectField<String>(
      //decoration: const InputDecoration(),
      title: "Select",
      items: dataString,
      enableAllOptionSelect: true,
      onSelectionDone: _onCountriesSelectionComplete,
      itemAsString: (item) => item.toString(),
    );
  }

  void _onCountriesSelectionComplete(value) {
    selectedDataString?.addAll(value);
    setState(() {});
  }
}
