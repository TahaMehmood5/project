import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:discipline_committee/Global/Notification.dart';
import 'package:discipline_committee/Global/Profile_Screen.dart';
import 'package:discipline_committee/Global/Widgets/constant.dart';
import 'package:discipline_committee/screens/Admin/NewReport.dart';
import 'package:discipline_committee/screens/Admin/admin.dart';
import 'package:discipline_committee/screens/Committe_Member/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

const List<TabItem> items = [
  TabItem(
    count: ButtonBar(),
    icon: Icons.map_rounded,
    title: 'Map',
  ),
  TabItem(
    icon: Icons.graphic_eq,
    title: 'Stats',
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

class Navigater extends StatefulWidget {
  const Navigater({Key? key}) : super(key: key);

  //const DashBoard({super.key});

  @override
  _NavigaterState createState() => _NavigaterState();
}

class _NavigaterState extends State<Navigater> {
  int visit = 0;
  double height = 30;

  int selectedindex = 0;
  List<Widget> screens = [
    //const MapScreen(),
    //const MapScreen2(),
    //const MapsDemo(),

    const CommitteeDashoard_Screen(),
    Adminscreen(),
    Notification_Screen(),
    Profile_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: screens[selectedindex],
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
