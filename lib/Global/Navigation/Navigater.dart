import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:discipline_committee/Global/Notification.dart';
import 'package:discipline_committee/Global/Profile_Screen.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/screens/Admin/NewReport.dart';
import 'package:discipline_committee/screens/Admin/admin.dart';
import 'package:discipline_committee/screens/Committe_Member/Committee_Dashboard.dart';
import 'package:discipline_committee/screens/Director/Director_Dashboard.dart';
import 'package:discipline_committee/screens/HOC/HOC_Dashboard.dart';
import 'package:discipline_committee/screens/Student/StudentDashboard.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.graphic_eq,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.notifications,
    title: 'Notications',
  ),
  TabItem(
    icon: Icons.person,
    title: 'profile',
  ),
];

class Nav_Bar extends StatefulWidget {
  const Nav_Bar({Key? key}) : super(key: key);

  //const DashBoard({super.key});

  @override
  _Nav_BarState createState() => _Nav_BarState();
}

class _Nav_BarState extends State<Nav_Bar> {
  int visit = 0;
  double height = 30;

  int selectedindex = 0;

  List<Widget> adminscreen = [
    const Adminscreen(),
    Notification_Screen(),
    Profile_Screen(),
  ];
  List<Widget> Committeescreen = [
    const CommitteeDashboard_Screen(),
    Notification_Screen(),
    Profile_Screen(),
  ];
  List<Widget> HOCscreen = [
    const HOCDashboard_Screen(),
    Notification_Screen(),
    Profile_Screen(),
  ];
  List<Widget> Directorscreen = [
    const DirectorDashboard_Screen(),
    Notification_Screen(),
    Profile_Screen(),
  ];
  List<Widget> Studentscreen = [
    const StudentDashboard(),
    Notification_Screen(),
    Profile_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: loggedInUser!.usertype == "std"
              ? Studentscreen[selectedindex]
              : loggedInUser!.usertype == "adm"
                  ? adminscreen[selectedindex]
                  : loggedInUser!.usertype == "dr"
                      ? Directorscreen[selectedindex]
                      : loggedInUser!.usertype == "hoc"
                          ? HOCscreen[selectedindex]
                          : Committeescreen[selectedindex],
          bottomNavigationBar: SizedBox(
            child: BottomBarInspiredOutside(
              items: items,
              backgroundColor: btnColor,
              color: Colors.white,
              colorSelected: Colors.white,
              indexSelected: visit,
              onTap: (int index) => setState(() {
                visit = index;
                selectedindex = index;
              }),
              //top: -25,
              animated: true,
              itemStyle: ItemStyle.hexagon,
              chipStyle: const ChipStyle(drawHexagon: true),
            ),
          ),
        ),
      ),
    );
  }
}
