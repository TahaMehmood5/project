import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';

class HOCDropDown extends StatefulWidget {
  const HOCDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<HOCDropDown> createState() => _HOCDropDownState();
}

class _HOCDropDownState extends State<HOCDropDown> {
  List<String> dataString = [
    "Dr Nasser",
    "Sir Umar farooq",
    "Sir Zahid",
    "Sir Shahid Jamil",
  ];
  String? selectedString;
  List<String>? selectedDataString;

  @override
  Widget build(BuildContext context) {
    return CustomSingleSelectField<String>(
      //decoration: const InputDecoration(),
      title: "Select",
      items: dataString,
      onSelectionDone: _onCountriesSelectionComplete,
      itemAsString: (item) => item.toString(),
    );
  }

  void _onCountriesSelectionComplete(value) {
    selectedDataString?.addAll(value);
    setState(() {});
  }
}
