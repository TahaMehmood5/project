import 'package:discipline_committee/Global/Widgets/constant.dart';
import 'package:discipline_committee/Global/Widgets/tester.dart';
import 'package:discipline_committee/mywidgets/button.dart';
import 'package:discipline_committee/screens/Admin/NewReport.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Admintab extends StatefulWidget {
  const Admintab({super.key});

  @override
  State<Admintab> createState() => _AdmintabState();
}

class ItemLists {
  String? aridno;
  String? violation;
  String? user;
  ItemLists({this.user, required this.aridno, required this.violation});
  String? Facultym = 'Faculty Member';
}

class _AdmintabState extends State<Admintab> {
  List<ItemLists> previtems = [
    ItemLists(
      user: "Ali Ashraf",
      aridno: '2019-arid-3106',
      violation: 'Fighting',
    ),
    ItemLists(
      user: "Hamza Sagheer",
      aridno: '2019-arid-3032',
      violation: 'Harrasment',
    ),
    ItemLists(
      user: "Sikandar Iqbal",
      aridno: '2019-arid-3096',
      violation: 'Smoking',
    ),
    ItemLists(
      user: "Taha Mehmood",
      aridno: '2019-arid-2986',
      violation: 'Lab Damage',
    ),
    ItemLists(
      user: "M.Huzaifa",
      aridno: '2019-arid-3001',
      violation: 'Misbave With Teacher',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.only(
            top: 5,
            left: 8,
            right: 8,
            //bottom: 3,
          ),
          labelColor: ScfColor,
          unselectedLabelColor: Colors.black54,
          //indicatorColor: Colors.amber,
          indicator: BoxDecoration(
              //shape: BoxShape.rectangle,
              border: const Border.symmetric(),
              borderRadius: BorderRadius.circular(5), // Creates border
              color: tabColor), //Change background color from here
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            const Tab(
              text: "Previous Reports",
            ),
            const Tab(
              text: "Add New Report",
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              ListView.builder(
                itemCount: previtems.length,
                itemBuilder: (context, index) {
                  return Card(
                    //                           <-- Card widget
                    child: ListTile(
                      contentPadding: EdgeInsets.all(5),
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/dp.png'),
                      ),
                      title: Text(
                        "${previtems[index].aridno}",
                        style: GoogleFonts.gemunuLibre(
                          fontWeight: FontWeight.w600,
                          color: txtColor,
                          fontSize: 25,
                        ),
                      ),
                      subtitle: Text(
                        "(${previtems[index].user}) : ${previtems[index].violation}",
                        style: GoogleFonts.gemunuLibre(
                          fontWeight: FontWeight.w400,
                          color: btnColor,
                          fontSize: 20,
                        ),
                      ),
                      trailing: ButtonWidget(
                        btnText: "view",
                        onPress: () {
                          getDialogue(context);
                        },
                      ), //           <-- subtitle
                    ),
                  );
                },
              ),
              NewReport_Screen(),
            ],
          ),
        ),
      ),
    );
  }
}
