import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import '../../Global/Widgets/tester.dart';
import '../../Global/Widgets/textField_widget.dart';
import '../../Global/Widgets/text_widget.dart';
import '../../mywidgets/button.dart';
import '../Admin/NewReport.dart';
import '../Student/DropDownViolation.dart';
import 'PunishmentDropDown.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart'
    as dropvalue;

class AssignPunishmentScreen extends StatefulWidget {
  const AssignPunishmentScreen({super.key});

  @override
  State<AssignPunishmentScreen> createState() => _AssignPunishmentScreenState();
}

class _AssignPunishmentScreenState extends State<AssignPunishmentScreen> {
  int? selectedP, f_amount, f_type;
  String? NewP;
  DateTime? startdate, enddate;
  String? filter = "fm";

  TextEditingController Pdropdown = TextEditingController();
  TextEditingController famount = TextEditingController();

  List<String> comity = [];
  Map<String, int> comityIds = {};
  List<int> selectedcomityId = [];

  Future<Map<String, int>> getCommitteesWithIds() async {
    final response = await http.get(Uri.parse('$api/Getcommetiee'));

    if (response.statusCode == 200) {
      final usersJson = jsonDecode(response.body) as List<dynamic>;
      final users = usersJson.fold<Map<String, int>>({}, (map, user) {
        final name = user['name'];
        final userId = user['u_id'];
        if (name != null && userId != null) {
          return map..[name] = userId;
        } else {
          return map;
        }
      });

      return users;
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          title: "Assign Punishment",
          txtSize: 28,
          txtColor: txtColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Divider(
              color: btnColor,
              height: 2,
              thickness: 4,
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              //isThreeLine: true,
              // subtitle: TextWidget(
              //     title: "lkjj", txtSize: 15, txtColor: txtColor),
              contentPadding: EdgeInsets.all(0),
              title: const Text('Punishment Only'),
              leading: Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 93, 63, 143)),
                value: 'fm',
                groupValue: filter,
                onChanged: (value) {
                  setState(() {
                    filter = value;
                    f_type = 0;
                  });
                },
              ),
            ),
            ListTile(
              //isThreeLine: true,
              // subtitle: TextWidget(
              //     title: "lkjj", txtSize: 15, txtColor: txtColor),
              contentPadding: EdgeInsets.all(0),
              title: const Text('Fine Only'),
              leading: Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 93, 63, 143)),
                value: 'fm',
                groupValue: filter,
                onChanged: (value) {
                  setState(() {
                    filter = value;
                    f_type = 1;
                  });
                },
              ),
            ),
            ListTile(
              //isThreeLine: true,
              // subtitle: TextWidget(
              //     title: "lkjj", txtSize: 15, txtColor: txtColor),
              contentPadding: EdgeInsets.all(0),
              title: const Text('Both'),
              leading: Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 93, 63, 143)),
                value: 'fm',
                groupValue: filter,
                onChanged: (value) {
                  setState(() {
                    filter = value;
                    f_type = 2;
                  });
                },
              ),
            ),
            f_type == 0 || f_type == 2
                ? TextWidget(
                    title: "Select Punishment", txtSize: 20, txtColor: txtColor)
                : SizedBox(),
            SizedBox(
              height: 15,
            ),
            f_type == 0 || f_type == 2
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FutureBuilder<Map<String, int>>(
                      future: getCommitteesWithIds(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          comityIds = snapshot.data!;
                          comity = comityIds.keys.toList();
                          return dropvalue.CustomMultiSelectField<String>(
                            title: 'Select Categories',
                            items: comity,
                            onSelectionDone: (values) {
                              final selectedIds = values
                                  .map<int>((value) => comityIds[value]!)
                                  .toList();
                              setState(() {
                                selectedcomityId = selectedIds;
                              });
                            },
                            itemAsString: (item) => item.toString(),
                          );
                        } else if (snapshot.hasError) {
                          return const Text('Error fetching officers data');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 15,
            ),
            f_type == 0 || f_type == 2
                ? InputTxtField(
                    label: "Add Punishment",
                    hintText: "",
                    controller: Pdropdown,
                    validator: null,
                  )
                : SizedBox(),
            SizedBox(
              height: 15,
            ),
            ButtonWidget(
              btnText: "Pick Date Range",
              onPress: () {
                showCustomDateRangePicker(
                  context,
                  backgroundColor: Colors.white,
                  primaryColor: btnColor,
                  dismissible: true,
                  minimumDate:
                      DateTime.now().subtract(const Duration(days: 60)),
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
            TextWidget(
              title:
                  '${FromDate != null ? DateFormat('dd-MMM-yyyy').format(FromDate!) : '-'}  To  ${ToDate != null ? DateFormat('dd-MMM-yyyy').format(ToDate!) : '-'}',
              txtSize: 20,
              txtColor: txtColor,
            ),
            SizedBox(
              height: 20,
            ),
            f_type == 1 || f_type == 2
                ? TextWidget(title: "Add Fine", txtSize: 20, txtColor: txtColor)
                : SizedBox(),
            SizedBox(
              height: 15,
            ),
            f_type == 1 || f_type == 2
                ? InputTxtField(
                    keytype: TextInputType.number,
                    label: "Add Fine",
                    hintText: "",
                    controller: famount,
                    validator: null,
                  )
                : SizedBox(),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
                btnText: "Submit",
                onPress: () {
                  getDialogue(context);
                })
          ]),
        ),
      ),
    );
  }
}
