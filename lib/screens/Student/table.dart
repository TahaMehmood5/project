import 'dart:convert';

import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  TextEditingController text = TextEditingController();
  final _rows = <PlutoRow>[];
  final _columns = [
    PlutoColumn(
      title: 'User ID',
      field: 'user_id',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Name',
      field: 'name',
      type: PlutoColumnType.text(),
    ),

    PlutoColumn(
      title: 'Sector',
      field: 'sec_name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Email',
      field: 'email',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Phone Number',
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
    _fetchwithsectors(true);
    // _loadData();
  }

  void _fetchwithsectors(bool? ispunished) async {
    try {
      //final response = await http.get(Uri.parse('$api/GetUsers'));
      final response =
          await http.get(Uri.parse('$api/GetCases?ispunished=$ispunished'));

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
    } catch (e) {
      //
    }
  }

  void _fetchwithoutSectors(bool ispunished) async {
    //final response = await http.get(Uri.parse('$api/Getofficers'));
    final response =
        await http.get(Uri.parse('$api/GetCases?ispunished=$ispunished'));

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
      _isAllCases = prefs.getBool('IS_ALL') ?? false;
    });
  }

  // ignore: non_constant_identifier_names
  void _getUsers(bool value, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('IS_ALL', value);
    if (value == true) {
      _fetchwithsectors(value);
    } else {
      _fetchwithoutSectors(value);
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
                title: "All Health Users", txtSize: 20, txtColor: txtColor),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextWidget(
                          title: "All Users", txtSize: 15, txtColor: txtColor),
                      Switch.adaptive(
                        inactiveTrackColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        inactiveThumbColor:
                            const Color.fromARGB(255, 246, 195, 195),
                        //enableFeedback: true,
                        activeColor: btnColor,
                        value: _isAllCases,
                        onChanged: (value) {
                          setState(
                            () {
                              _isAllCases = value;
                              _getUsers(value, context);
                            },
                          );
                        },
                      ),
                      TextWidget(
                          title: "Users with Sectorss",
                          txtSize: 15,
                          txtColor: txtColor),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // const UsersScreen(),
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
        ),
      ),
    );
  }
}
