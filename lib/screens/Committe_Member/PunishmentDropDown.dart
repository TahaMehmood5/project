import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';

class PunishmentDropDown extends StatefulWidget {
  const PunishmentDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<PunishmentDropDown> createState() => _PunishmentDropDownState();
}

class _PunishmentDropDownState extends State<PunishmentDropDown> {
  List<String> dataString = [
    "Community Service",
    "Washing Dishes",
    "Sweeping",
    "Serving",
  ];
  String? selectedString;
  List<String>? selectedDataString;

  @override
  Widget build(BuildContext context) {
    return CustomMultiSelectField<String>(
      //decoration: const InputDecoration(),
      title: "Select",
      items: dataString,
      enableAllOptionSelect: false,
      onSelectionDone: _onCountriesSelectionComplete,
      itemAsString: (item) => item.toString(),
    );
  }

  void _onCountriesSelectionComplete(value) {
    selectedDataString?.addAll(value);
    setState(() {});
  }
}
