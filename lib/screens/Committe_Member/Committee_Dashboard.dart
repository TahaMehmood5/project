import 'package:discipline_committee/Global/Widgets/Container_Widget.dart';
import 'package:discipline_committee/Global/Widgets/button_widget.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/Global/Widgets/tester.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/screens/Committe_Member/Report_View_Committee.dart';
import 'package:discipline_committee/screens/Committe_Member/expandable_Datatable.dart';
import 'package:discipline_committee/screens/HOC/Add_Committee.dart';
import 'package:discipline_committee/screens/Director/Student_Appeal.dart';
import 'package:discipline_committee/screens/Student/StudentDashboard.dart';
import 'package:discipline_committee/screens/Student/table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CommitteeDashboard_Screen extends StatefulWidget {
  const CommitteeDashboard_Screen({super.key});

  @override
  State<CommitteeDashboard_Screen> createState() =>
      _CommitteeDashboard_ScreenState();
}

class _CommitteeDashboard_ScreenState extends State<CommitteeDashboard_Screen> {
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
                  title: "Director Dashboard",
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ReportView_Screen()));
                        },
                        color: Colors.orange,
                        isSmall: true,
                        icon: Icons.mobile_friendly,
                        subtitle: "",
                        heading: "Pending Cases",
                      ),
                    ),
                    Container(
                      height: 190,
                      width: 150,
                      child: MyContainer(
                        ontap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AddCommittee_Screen(),
                            ),
                          );
                        },
                        color: Colors.blue,
                        isSmall: true,
                        icon: Icons.mobile_friendly,
                        subtitle: "",
                        heading: "All Cases",
                      ),
                    ),
                  ],
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const AddCommittee_Screen()));
                        },
                        color: Colors.red,
                        isSmall: true,
                        icon: Icons.mobile_friendly,
                        subtitle: "",
                        heading: "Appeals",
                      ),
                    ),
                    Container(
                      height: 190,
                      width: 150,
                      child: MyContainer(
                        ontap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const StudentAppeal_Screen(),
                            ),
                          );
                        },
                        color: Colors.purple,
                        isSmall: true,
                        icon: Icons.mobile_friendly,
                        subtitle: "",
                        heading: "Meetings",
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         height: 190,
              //         width: 150,
              //         child: MyContainer(
              //           ontap: () {
              //             Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => const StudentDashboard()));
              //           },
              //           color: Colors.green,
              //           isSmall: true,
              //           icon: Icons.mobile_friendly,
              //           subtitle: "",
              //           heading: "Meetings",
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 690, color: btnColor, child: UsersListScreen()),
              ),
              SizedBox(
                height: 30,
              )
              // Container(
              //   width: 200,
              //   child: ButtonWidget(
              //       btnText: "Logout",
              //       onPress: () {
              //         getDialogue(context);
              //       }),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
