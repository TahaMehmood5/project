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
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:draggable_menu/draggable_menu.dart';

class ReportView_Screen extends StatefulWidget {
  int? uid;

  ReportView_Screen({
    super.key,
    this.uid,
  });

  @override
  State<ReportView_Screen> createState() => _ReportView_ScreenState();
}

// Initial Selected Value
String dropdownvalue = 'Faculty 2';

// List of items in our dropdown menu
var _items = [
  'Faculty 2',
  'LT-4',
  'Lab 4',
  'Conference Room',
  'Director Office',
];
DateTime? dateTime;

class _ReportView_ScreenState extends State<ReportView_Screen> {
  TextEditingController test = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          title: "Report",
          txtSize: 25,
          txtColor: txtColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(
                    title: "Reported Student:",
                    txtSize: 28,
                    txtColor: txtColor,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextWidget(
                    title: "",
                    txtSize: 18,
                    txtColor: txtColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title: "Reported by:",
                    txtSize: 28,
                    txtColor: txtColor,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextWidget(
                    title: "",
                    txtSize: 18,
                    txtColor: txtColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(
                    title: "Arid No. :",
                    txtSize: 28,
                    txtColor: txtColor,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextWidget(
                    title: "",
                    txtSize: 18,
                    txtColor: txtColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(
                    title: "Violation:",
                    txtSize: 28,
                    txtColor: txtColor,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextWidget(
                    title: "",
                    txtSize: 18,
                    txtColor: txtColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextWidget(
                      title: "Image",
                      txtSize: 25,
                      txtColor: txtColor,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      height: 150,
                      width: 180,
                      color: Color.fromARGB(255, 250, 249, 248),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // MyTextField(
              //   controller: test,
              //   hintText: "Description",
              //   obscureText: false,
              //   maxlines: 1,
              // ),
              MyTextField_ReadOnly(
                readonly: true,
                controller: test,
                hintText: "Caught Fighting by the guard in the Main Hall",
                //obscureText: false,
                maxlines: 3,
              ),
              SizedBox(
                height: 15,
              ),
              CheckboxListTile(
                // tileColor: Colors.red,
                title: TextWidget(
                  title: 'Is Fine Paid?',
                  txtSize: 28,
                  txtColor: txtColor,
                ),
                value: true,
                onChanged: (bool? value) {},
              ),

              SizedBox(
                height: 15,
              ),
              loggedInUser!.usertype == "adm"
                  ? ButtonWidget(
                      btnText: "Punishment Attendence",
                      onPress: () {
                        DraggableMenu.open(
                          context,
                          DraggableMenu(
                            // color: ScfColor2,
                            // uiType: DraggableMenuUiType.softModern,
                            expandable: true,
                            fastDrag: true,
                            minimizeBeforeFastDrag: true,
                            expandedHeight:
                                MediaQuery.of(context).size.height * 0.72,
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.36,
                            child: ScrollableManager(
                              enableExpandedScroll: true,
                              child: Scaffold(
                                body: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        HeatMapCalendar(
                                          datasets: {
                                            DateTime(2023, 5, 6): 7,
                                            DateTime(2023, 5, 7): 7,
                                            DateTime(2023, 5, 8): 1,
                                            DateTime(2023, 5, 9): 1,
                                            DateTime(2023, 5, 10): 1,
                                          },
                                          colorMode: ColorMode.color,
                                          textColor: txtColor,
                                          // showText: false,
                                          // scrollable: true,
                                          colorsets: const {
                                            1: Colors.red,
                                            7: Colors.green,
                                            // 3: Colors.orange,
                                            // 5: Colors.yellow,

                                            // 9: Colors.blue,
                                            // 11: Colors.indigo,
                                            // 13: Colors.purple,
                                          },
                                          onClick: (value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  value.toString(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ButtonWidget(
                                          btnText: "Save",
                                          onPress: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          barrier: true,
                        );
                      },
                    )
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Divider(
                  height: 5,
                  color: btnColor,
                  thickness: 3,
                ),
              ),
              ButtonWidget(
                btnText: "Set meeting schedule",
                onPress: () async {
                  dateTime = await showOmniDateTimePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime(1600).subtract(const Duration(days: 3652)),
                    lastDate: DateTime.now().add(
                      const Duration(days: 3652),
                    ),
                    is24HourMode: false,
                    isShowSeconds: false,
                    minutesInterval: 1,
                    secondsInterval: 1,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                title: "$dateTime",
                txtSize: 15,
                txtColor: txtColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextWidget(
                    title: "Select Venue",
                    txtSize: 15,
                    txtColor: txtColor,
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: _items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
              ButtonWidget(
                btnText: "Proceed",
                onPress: (() {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Divider(
                  height: 5,
                  color: btnColor,
                  thickness: 3,
                ),
              ),
              Container(
                width: 200,
                child: ButtonWidget(
                    btnText: "Check Previous record",
                    onPress: () {
                      showDialog(
                        //useSafeArea: true,
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: (() {
                                    Navigator.of(context).pop();
                                  }),
                                  icon: const Icon(Icons.cancel),
                                ),
                              ],
                            ),
                            Container(
                              width: 490,
                              height: 590,
                              color: btnColor,
                              child: Expandable_Table_Screen(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 200,
                child: ButtonWidget(
                    btnText: "Assign Punishment",
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AssignPunishmentScreen(),
                        ),
                      );
                    }),
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     List<DateTime>? dateTimeList =
              //         await showOmniDateTimeRangePicker(
              //       context: context,
              //       startInitialDate: DateTime.now(),
              //       startFirstDate:
              //           DateTime(1600).subtract(const Duration(days: 3652)),
              //       startLastDate: DateTime.now().add(
              //         const Duration(days: 3652),
              //       ),
              //       endInitialDate: DateTime.now(),
              //       endFirstDate:
              //           DateTime(1600).subtract(const Duration(days: 3652)),
              //       endLastDate: DateTime.now().add(
              //         const Duration(days: 3652),
              //       ),
              //       is24HourMode: false,
              //       isShowSeconds: false,
              //       minutesInterval: 1,
              //       secondsInterval: 1,
              //       borderRadius: const BorderRadius.all(Radius.circular(16)),
              //       constraints: const BoxConstraints(
              //         maxWidth: 350,
              //         maxHeight: 650,
              //       ),
              //       transitionBuilder: (context, anim1, anim2, child) {
              //         return FadeTransition(
              //           opacity: anim1.drive(
              //             Tween(
              //               begin: 0,
              //               end: 1,
              //             ),
              //           ),
              //           child: child,
              //         );
              //       },
              //       transitionDuration: const Duration(milliseconds: 200),
              //       barrierDismissible: true,
              //       selectableDayPredicate: (dateTime) {
              //         // Disable 25th Feb 2023
              //         if (dateTime == DateTime(2023, 2, 25)) {
              //           return false;
              //         } else {
              //           return true;
              //         }
              //       },
              //     );

              //     print("Start dateTime: ${dateTimeList?[0]}");
              //     print("End dateTime: ${dateTimeList?[1]}");
              //   },
              //   child: const Text("Show DateTime Range Picker"),
              // ),
              // Container(
              //   height: 35,
              //   color: ScfColor,
              //   child: Container(
              //     width: 200,
              //     child: ButtonWidget(
              //       btnText: "Set Meeting Schdule",
              //       onPress: () {
              //         showCustomDateRangePicker(
              //           context,
              //           dismissible: true,
              //           minimumDate:
              //               DateTime.now().subtract(const Duration(days: 60)),
              //           maximumDate: DateTime.now(),
              //           endDate: endDate,
              //           startDate: startDate,
              //           onApplyClick: (end, start) {
              //             setState(() {
              //               endDate = end;
              //               startDate = start;
              //             });
              //           },
              //           onCancelClick: () {
              //             setState(() {
              //               endDate = null;
              //               startDate = null;
              //             });
              //           },
              //         );
              //       },
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
