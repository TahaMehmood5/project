import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/Global/Widgets/tester.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/Global/Widgets/textfield_Round_readonly.dart';
import 'package:discipline_committee/mywidgets/button.dart';
import 'package:discipline_committee/screens/Committe_Member/AssignPunishment.dart';
import 'package:discipline_committee/screens/Committe_Member/expandable_Datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:intl/intl.dart';
import 'package:draggable_menu/draggable_menu.dart';

import 'DropdownHOC.dart';

class AppointHoc_Screen extends StatefulWidget {
  const AppointHoc_Screen({super.key});

  @override
  State<AppointHoc_Screen> createState() => _AppointHoc_ScreenState();
}

// Initial Selected Value
String dropdownvalue = 'Faculty 2';
String? _selectedOption;
// List of items in our dropdown menu
var _items = [
  'Faculty 2',
  'LT-4',
  'Lab 4',
  'Conference Room',
  'Director Office',
];
DateTime? dateTime;

class _AppointHoc_ScreenState extends State<AppointHoc_Screen> {
  TextEditingController test = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  String? filter = "fm";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(
            title: "Appoint HOC",
            txtSize: 25,
            txtColor: txtColor,
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: [
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextWidget(
                          title: "Current HOC:",
                          txtSize: 28,
                          txtColor: txtColor,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        TextWidget(
                          title: "Saeed Watto",
                          txtSize: 28,
                          txtColor: txtColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                          title: "Appoint New Hoc :",
                          txtSize: 28,
                          txtColor: txtColor)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Permanent',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value.toString();
                          });
                        },
                      ),
                      Text('Permanent'),
                      SizedBox(width: 30),
                      Radio(
                        value: 'Temporary',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value.toString();
                          });
                        },
                      ),
                      Text('Temporary'),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        btnText: "Pick Date Range",
                        onPress: () {
                          showCustomDateRangePicker(
                            context,
                            backgroundColor: Colors.white,
                            primaryColor: btnColor,
                            dismissible: true,
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 60)),
                            maximumDate: DateTime.now(),
                            endDate: ToDate,
                            startDate: FromDate,
                            onApplyClick: (start, end) {
                              setState(() {
                                ToDate = end;
                                FromDate = start;
                                //getChartDatabyrange(FromDate, ToDate);
                              });
                            },
                            onCancelClick: () {
                              setState(() {
                                ToDate = null;
                                FromDate = null;
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        title:
                            '${FromDate != null ? DateFormat('dd-MMM-yyyy').format(FromDate!) : '-'}  To  ${ToDate != null ? DateFormat('dd-MMM-yyyy').format(ToDate!) : '-'}',
                        txtSize: 20,
                        txtColor: txtColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(children: [
                      TextWidget(
                        title: "Select New HOC",
                        txtSize: 20,
                        txtColor: txtColor,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HOCDropDown(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonWidget(
                          btnText: "Submit",
                          onPress: () {
                            getDialogue(context);
                          })
                    ]),
                  )
                ]))));
  }
}
