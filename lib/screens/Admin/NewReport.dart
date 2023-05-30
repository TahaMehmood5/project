// import 'dart:js';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:discipline_committee/Global/Widgets/SnackBar_widget.dart';
import 'package:discipline_committee/Global/Widgets/button_widget.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/Global/Widgets/textField_widget.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/Global/Widgets/txtfield_Round.dart';
import 'package:discipline_committee/screens/Committe_Member/Committee_Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:dio/dio.dart';

import '../Committe_Member/Report_View.dart';

class NewReport_Screen extends StatefulWidget {
  const NewReport_Screen({super.key});

  @override
  State<NewReport_Screen> createState() => _NewReport_ScreenState();
}

// Initial Selected Value
String dropdownvalue = 'Smoking';

// List of items in our dropdown menu

class _NewReport_ScreenState extends State<NewReport_Screen> {
  @override
  void initState() {
    super.initState();
    getCommittees();
  }

  List<String> committeeTitles = [];
  String? selectedCommittee;

  Future<void> getCommittees() async {
    try {
      var response = await Dio().get('$api/Getcommetiee');

      if (response.statusCode == 200) {
        if (response.data != 'false') {
          List<Map<String, dynamic>> committees =
              List<Map<String, dynamic>>.from(response.data);

          setState(() {
            committeeTitles = committees
                .map((committee) => committee["title"].toString())
                .toList();
          });
        } else {
          // Handle API error or empty response
        }
      } else {
        // Handle API error
      }
    } catch (error) {
      // Handle network or other errors
    }
  }

  TextEditingController test = TextEditingController();
  TextEditingController test1 = TextEditingController();
  TextEditingController test2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: TextWidget(
              title: "Reported By",
              txtSize: 25,
              txtColor: txtColor,
            ),
          ),
          //backgroundColor: Colors.amber,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      //isThreeLine: true,
                      // subtitle: TextWidget(
                      //     title: "lkjj", txtSize: 15, txtColor: txtColor),
                      contentPadding: EdgeInsets.all(0),
                      title: const Text('Faculty member'),
                      leading: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 93, 63, 143)),
                        value: test,
                        groupValue: test,
                        onChanged: (value) {
                          setState(() {
                            value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: const Text('Non Faculty Member'),
                      leading: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 90, 52, 126)),
                        value: null,
                        groupValue: test,
                        onChanged: (value) {
                          setState(() {
                            value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: const Text('Student'),
                      leading: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => btnColor),
                        value: null,
                        groupValue: test,
                        onChanged: (value) {
                          setState(() {
                            value;
                          });
                        },
                      ),
                    ),
                    InputTxtField(
                      label: "search user",
                      siconn: Icons.search,
                      hintText: "Search",
                      controller: test,
                      validator: null,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputTxtField(
                      label: "Reported Student",
                      siconn: Icons.search,
                      hintText: "Search",
                      controller: test1,
                      validator: null,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      title: "Description",
                      txtSize: 18,
                      txtColor: txtColor,
                    ),
                    MyTextField(
                      controller: test2,
                      hintText: "Description",
                      obscureText: false,
                      // maxlines: 8,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextWidget(
                          title: "Upload Image",
                          txtSize: 15,
                          txtColor: txtColor,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Container(
                          height: 100,
                          width: 120,
                          color: Color.fromARGB(255, 248, 245, 234),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ButtonWidget(
                              btnText: "Pick Image",
                              onPress: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextWidget(
                          title: "Select Category",
                          txtSize: 15,
                          txtColor: txtColor,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        DropdownButton<String>(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: committeeTitles.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      btnText: "Select Violation Date",
                      onPress: () async {
                        dateTime = await showOmniDateTimePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1600)
                              .subtract(const Duration(days: 3652)),
                          lastDate: DateTime.now().add(
                            const Duration(days: 3652),
                          ),
                          is24HourMode: false,
                          isShowSeconds: false,
                          minutesInterval: 1,
                          secondsInterval: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          constraints: const BoxConstraints(
                            maxWidth: 350,
                            maxHeight: 650,
                          ),
                          transitionBuilder: (context, anim1, anim2, child) {
                            return FadeTransition(
                              opacity: anim1.drive(
                                Tween(
                                  begin: 0,
                                  end: 1,
                                ),
                              ),
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 200),
                          barrierDismissible: true,
                          selectableDayPredicate: (dateTime) {
                            // Disable 25th Feb 2023
                            if (dateTime == DateTime(2023, 2, 25)) {
                              return false;
                            } else {
                              return true;
                            }
                          },
                        );
                        setState(() {});
                        // print("dateTime: $dateTime");
                      },
                    ),
                    TextWidget(
                      title:
                          '${dateTime != null ? DateFormat('dd-MMM-yyyy\nhh:mm').format(dateTime!) : 'No Date Selected'} ',
                      txtSize: 15,
                      txtColor: txtColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 200,
                      child: ButtonWidget(
                          btnText: "Save",
                          onPress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const CommitteeDashboard_Screen()));
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
