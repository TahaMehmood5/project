export 'package:pluto_grid/pluto_grid.dart';

import 'dart:convert';

import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/screens/Student/table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Global/constant.dart';

class TableListScreen extends StatefulWidget {
  const TableListScreen({Key? key}) : super(key: key);

  @override
  State<TableListScreen> createState() => _TableListScreenState();
}

class _TableListScreenState extends State<TableListScreen> {
  TextEditingController text = TextEditingController();
  final _rows = <PlutoRow>[];
  final _columns = [
    PlutoColumn(
      title: 'Case ID',
      field: 'user_id',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Reported Student',
      field: 'name',
      type: PlutoColumnType.text(),
    ),

    PlutoColumn(
      title: 'Arid-No',
      field: 'sec_name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Violation',
      field: 'email',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Meeting Time',
      field: 'phone_number',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Committee Member',
      field: 'phone_number',
      type: PlutoColumnType.text(),
    ),

    // PlutoColumn(
    //   title: 'Role',
    //   field: 'role',
    //   type: PlutoColumnType.text(),
    // ),
  ];

  @override
  void initState() {
    super.initState();
    _fetchwithsectors();
    // _loadData();
  }

  void _fetchwithsectors() async {
    //final response = await http.get(Uri.parse('$api/Getofficers'));
    final response = await http.get(Uri.parse('$api/GetOfficerSectors'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      final List<PlutoRow> rows = data.map<PlutoRow>((item) {
        return PlutoRow(
          cells: {
            'user_id': PlutoCell(value: item['user_id']),
            'name': PlutoCell(value: item['name']),
            'email': PlutoCell(value: item['email']),
            'phone_number': PlutoCell(value: item['phone_number']),
            'role': PlutoCell(value: item['role']),
            'sec_name': PlutoCell(value: item['sector']['sec_name']),
          },
        );
      }).toList();

      setState(() {
        _rows.clear();
        _rows.addAll(rows);
      });
    }
  }

  void _fetchwithoutSectors() async {
    //final response = await http.get(Uri.parse('$api/Getofficers'));
    final response = await http.get(Uri.parse('$api/Getofficers'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      final List<PlutoRow> rows = data.map<PlutoRow>((item) {
        return PlutoRow(
          cells: {
            'user_id': PlutoCell(value: item['user_id']),
            'name': PlutoCell(value: item['name']),
            'email': PlutoCell(value: item['email']),
            'phone_number': PlutoCell(value: item['phone_number']),
            'role': PlutoCell(value: item['role']),
            'sec_name': PlutoCell(value: item['sec_name']),
          },
        );
      }).toList();

      setState(() {
        _rows.clear();
        _rows.addAll(rows);
      });
    }
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isAllOfficers = prefs.getBool('IS_ALL') ?? false;
    });
  }

  // ignore: non_constant_identifier_names
  void _getofficers(bool value, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('IS_ALL', value);
    if (value == true) {
      _fetchwithsectors();
    } else {
      _fetchwithoutSectors();
    }
  }

  late final PlutoGridStateManager stateManager;
  bool _isAllOfficers = false;
  @override
  Widget build(BuildContext context) {
    //final key = GlobalObjectKey<ExpandableFabState>(context);
    //var DataRepository;
    return Container(
      color: ScfColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ScfColor,
          appBar: AppBar(
            backgroundColor: ScfColor,
            // actions: [
            //   IconButton(
            //     onPressed: (() {
            //       Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const OfficerAddScreen(),
            //       ));
            //     }),
            //     icon: Icon(
            //       Icons.add_box_rounded,
            //       size: 30,
            //       color: btnColor,
            //     ),
            //   ),
            // ],
            title: TextWidget(
                title: "All Health Officers", txtSize: 20, txtColor: txtColor),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Divider(color: btnColor, thickness: 2),
                  const SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     TextWidget(
                  //         title: "All Officers",
                  //         txtSize: 15,
                  //         txtColor: txtColor),
                  //     Switch.adaptive(
                  //       inactiveTrackColor:
                  //           const Color.fromARGB(255, 255, 255, 255),
                  //       inactiveThumbColor:
                  //           const Color.fromARGB(255, 246, 195, 195),
                  //       //enableFeedback: true,
                  //       activeColor: btnColor,
                  //       value: _isAllOfficers,
                  //       onChanged: (value) {
                  //         setState(
                  //           () {
                  //             _isAllOfficers = value;
                  //             _getofficers(value, context);
                  //           },
                  //         );
                  //       },
                  //     ),
                  //     TextWidget(
                  //         title: "Officers with Sectorss",
                  //         txtSize: 15,
                  //         txtColor: txtColor),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // const OfficersScreen(),
                  Container(
                    color: ScfColor,
                    height: 600,
                    child: PlutoGrid(
                      configuration: PlutoGridConfiguration(
                        style: PlutoGridStyleConfig(
                          borderColor: bkColor,
                          gridBorderColor: btnColor,
                          gridBorderRadius: BorderRadius.circular(12),
                          //rowColor: btnColor,
                          columnTextStyle:
                              const TextStyle(fontWeight: FontWeight.w900),
                          cellTextStyle:
                              const TextStyle(fontWeight: FontWeight.w900),
                          activatedBorderColor: btnColor,
                          enableGridBorderShadow: true,
                        ),
                      ),
                      columns: _columns,
                      rows: _rows,
                      onChanged: (PlutoGridOnChangedEvent event) {},
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        stateManager = event.stateManager;
                        stateManager.setShowColumnFilter(true);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //floatingActionButtonLocation: ExpandableFab.location,
          // floatingActionButton: ExpandableFab(
          //   key: key,
          //   // duration: const Duration(seconds: 1),
          //   distance: 60.0,
          //   type: ExpandableFabType.fan,
          //   // fanAngle: 70,
          //   //child: const Icon(Icons.account_box),
          //   foregroundColor: ScfColor,
          //   backgroundColor: btnColor,
          //   closeButtonStyle: ExpandableFabCloseButtonStyle(
          //     //child: Icon(Icons.abc),
          //     foregroundColor: ScfColor,
          //     backgroundColor: btnColor,
          //   ),
          //   overlayStyle: ExpandableFabOverlayStyle(
          //     //color: Colors.black.withOpacity(0.5),
          //     blur: 5,
          //   ),
          //   onOpen: () {
          //     debugPrint('onOpen');
          //   },
          //   afterOpen: () {
          //     debugPrint('afterOpen');
          //   },
          //   onClose: () {
          //     debugPrint('onClose');
          //   },
          //   afterClose: () {
          //     debugPrint('afterClose');
          //   },
          //   children: [
          //     FloatingActionButton.small(
          //       tooltip: "Edit Officer",
          //       backgroundColor: btnColor,
          //       foregroundColor: ScfColor,
          //       heroTag: null,
          //       child: const Icon(Icons.edit),
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: ((context) => const Officer_Edit_Screen()),
          //           ),
          //         );
          //       },
          //     ),
          //     FloatingActionButton.small(
          //       tooltip: "Add New Officer",
          //       backgroundColor: btnColor,
          //       foregroundColor: ScfColor,
          //       heroTag: null,
          //       child: const Icon(Icons.add_box_rounded),
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: ((context) => const OfficerAddScreen()),
          //           ),
          //         );
          //       },
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
