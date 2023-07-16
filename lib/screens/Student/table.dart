import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/screens/Committe_Member/Report_View_Committee.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Global/Widgets/SnackBar_widget.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  String? dformater;
  TextEditingController text = TextEditingController();
  final _rows = <PlutoRow>[];
  final _columns = [
    PlutoColumn(
      title: 'Case No',
      field: 'case_id',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Reported student',
      field: 'name',
      type: PlutoColumnType.text(),
    ),

    PlutoColumn(
      title: 'Arid_No',
      field: 'aridno',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Violation',
      field: 'title',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Violaion_Date',
      field: 'Viol_Date',
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
    fetchwithPunishment(false);
    // _loadData();
  }

  void fetchwithPunishment(bool? ispunished) async {
    try {
      //final response = await http.get(Uri.parse('$api/GetUsers'));
      final response =
          await http.get(Uri.parse('$api/GetCases?ispunished=$ispunished'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        final List<PlutoRow> rows = data.map<PlutoRow>((item) {
          final dateTime = DateTime.parse(item['viol_date']);
          final formatter = DateFormat('dd-MM-yyyy');
          formatter.format(dateTime);
          item['viol_date'] = dateTime;
          return PlutoRow(
            cells: {
              'case_id': PlutoCell(value: item['c_id']),
              'name': PlutoCell(value: item['name']),
              'aridno': PlutoCell(value: item['username']),
              'title': PlutoCell(value: item['title']),
              'Viol_Date': PlutoCell(value: item['viol_date']),
              // 'sec_name': PlutoCell(value: item['sector']['sec_name']),
            },
          );
        }).toList();

        setState(() {
          _rows.clear();
          _rows.addAll(rows);
        });
      }
    } catch (e) {
      //
    }
  }

  void fetchwithoutPunishment(bool ispunished) async {
    //final response = await http.get(Uri.parse('$api/Getofficers'));
    final response =
        await http.get(Uri.parse('$api/GetCases?ispunished=$ispunished'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      final List<PlutoRow> rows = data.map<PlutoRow>((item) {
        return PlutoRow(
          cells: {
            'case_id': PlutoCell(value: item['c_id']),
            'name': PlutoCell(value: item['name']),
            'aridno': PlutoCell(value: item['username']),
            'title': PlutoCell(value: item['title']),
            'Viol_Date': PlutoCell(value: item['viol_date']),
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
      _isAllCases = prefs.getBool('IS_ALL') ?? false;
    });
  }

  // ignore: non_constant_identifier_names
  void _getUsers(bool value, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('IS_ALL', value);
    if (value == true) {
      fetchwithPunishment(value);
    } else {
      fetchwithoutPunishment(value);
    }
  }

  late final PlutoGridStateManager stateManager;
  bool _isAllCases = false;
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
            automaticallyImplyLeading: false,
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
                title: "Student Cases", txtSize: 20, txtColor: txtColor),
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
                  //         title: "All Users", txtSize: 15, txtColor: txtColor),
                  //     Switch.adaptive(
                  //       inactiveTrackColor:
                  //           const Color.fromARGB(255, 255, 255, 255),
                  //       inactiveThumbColor:
                  //           const Color.fromARGB(255, 246, 195, 195),
                  //       //enableFeedback: true,
                  //       activeColor: btnColor,
                  //       value: _isAllCases,
                  //       onChanged: (value) {
                  //         setState(
                  //           () {
                  //             _isAllCases = value;
                  //             _getUsers(value, context);
                  //           },
                  //         );
                  //       },
                  //     ),
                  //     TextWidget(
                  //         title: "Users with Sectorss",
                  //         txtSize: 15,
                  //         txtColor: txtColor),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  // const UsersScreen(),
                  Container(
                    color: ScfColor,
                    height: 600,
                    child: PlutoGrid(
                      onRowDoubleTap: (event) {
                        final selectedCell = event.cell;
                        final selectedValue = selectedCell.value ?? '';

                        // Navigate to ClusterMap if a cell is selected
                        if (selectedValue != null) {
                          setState(() {
                            snackBar(context, "Selected Value: $selectedValue");
                          });
                        }
                      },
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
        ),
      ),
    );
  }
}
