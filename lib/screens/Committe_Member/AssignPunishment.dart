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
import '../Student/DropDownViolation.dart';
import 'PunishmentDropDown.dart';

class AssignPunishmentScreen extends StatefulWidget {
  const AssignPunishmentScreen({super.key});

  @override
  State<AssignPunishmentScreen> createState() => _AssignPunishmentScreenState();
}

class _AssignPunishmentScreenState extends State<AssignPunishmentScreen> {
  @override
  TextEditingController testing = TextEditingController();
  TextEditingController testing1 = TextEditingController();
  TextEditingController test = TextEditingController();
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
              title: const Text('Both'),
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
              title: const Text('Punishment'),
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
              title: const Text('Fine'),
              leading: Radio(
                fillColor: MaterialStateColor.resolveWith((states) => btnColor),
                value: null,
                groupValue: test,
                onChanged: (value) {
                  setState(() {
                    value;
                  });
                },
              ),
            ),
            TextWidget(
                title: "Select Punishment", txtSize: 20, txtColor: txtColor),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PunishmentDropDown(),
            ),
            SizedBox(
              height: 15,
            ),
            InputTxtField(
              label: "Add Punishment",
              hintText: "",
              controller: testing,
              validator: null,
            ),
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
            TextWidget(title: "Add Fine", txtSize: 20, txtColor: txtColor),
            SizedBox(
              height: 15,
            ),
            InputTxtField(
              keytype: TextInputType.number,
              label: "Add Fine",
              hintText: "",
              controller: testing1,
              validator: null,
            ),
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
