import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';

class ViolationDropDown extends StatefulWidget {
  const ViolationDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<ViolationDropDown> createState() => _ViolationDropDownState();
}

class _ViolationDropDownState extends State<ViolationDropDown> {
  List<String> dataString = [
    "Smoking",
    "Harrasment",
    "Fighting",
    "Mishbehave With Teacher",
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
