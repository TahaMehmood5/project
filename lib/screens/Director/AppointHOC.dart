// import 'package:discipline_committee/Global/constant.dart';
// import 'package:discipline_committee/Global/Widgets/tester.dart';
// import 'package:discipline_committee/Global/Widgets/text_widget.dart';
// import 'package:discipline_committee/Global/Widgets/textfield_Round_readonly.dart';
// import 'package:discipline_committee/mywidgets/button.dart';
// import 'package:discipline_committee/screens/Committe_Member/AssignPunishment.dart';
// import 'package:discipline_committee/screens/Committe_Member/expandable_Datatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:custom_date_range_picker/custom_date_range_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:omni_datetime_picker/omni_datetime_picker.dart';
// import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
// import 'package:draggable_menu/draggable_menu.dart';

// class AppointHoc_Screen extends StatefulWidget {
//   const AppointHoc_Screen({super.key});

//   @override
//   State<AppointHoc_Screen> createState() => _AppointHoc_ScreenState();
// }

// // Initial Selected Value
// String dropdownvalue = 'Faculty 2';

// // List of items in our dropdown menu
// var _items = [
//   'Faculty 2',
//   'LT-4',
//   'Lab 4',
//   'Conference Room',
//   'Director Office',
// ];
// DateTime? dateTime;

// class _AppointHoc_ScreenState extends State<AppointHoc_Screen> {
//   TextEditingController test = TextEditingController();
//   DateTime? startDate;
//   DateTime? endDate;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextWidget(
//           title: "Report",
//           txtSize: 25,
//           txtColor: txtColor,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             children: [
//               Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TextWidget(
//                     title: "Reported Student:",
//                     txtSize: 28,
//                     txtColor: txtColor,
//                   ),
//                   SizedBox(
//                     width: 50,
//                   ),