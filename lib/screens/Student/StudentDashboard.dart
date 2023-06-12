import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/screens/HOC/Add_Committee.dart';
import 'package:discipline_committee/screens/Student/AppealForm.dart';
import 'package:discipline_committee/screens/Student/table.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../../Global/Widgets/Container_Widget.dart';
import '../../Global/Widgets/text_widget.dart';
import '../Committe_Member/Report_View.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: TextWidget(
                  title: "Student Dashboard",
                  txtSize: 35,
                  txtColor: txtColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 190,
                      width: 150,
                      child: MyContainer(
                        ontap: () {
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
                        color: Colors.orange,
                        isSmall: true,
                        icon: Icons.mobile_friendly,
                        subtitle: "",
                        heading: "Check Progress Report",
                      ),
                    ),
                    Container(
                      height: 190,
                      width: 150,
                      child: MyContainer(
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AppealForm_Screen()));
                        },
                        color: Colors.blue,
                        isSmall: true,
                        icon: Icons.mobile_friendly,
                        subtitle: "",
                        heading: "Make Appeal",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 190,
                      width: 150,
                      child: MyContainer(
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ReportView_Screen()));
                        },
                        color: Colors.green,
                        isSmall: true,
                        icon: Icons.mobile_friendly,
                        subtitle: "",
                        heading: "Meeting Schedules",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // Container(
                    //   height: 190,
                    //   width: 150,
                    //   child: MyContainer(
                    //     ontap: () {
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (context) => const AddCommittee_Screen(),
                    //         ),
                    //       );
                    //     },
                    //     color: Colors.orange,
                    //     isSmall: true,
                    //     icon: Icons.mobile_friendly,
                    //     subtitle: "Edit/Mdify",
                    //     heading: "Committee",
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                height: 500,
                child: UsersListScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
