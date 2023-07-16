// import 'dart:js';

import 'dart:convert';
import 'dart:io';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:discipline_committee/Global/Widgets/SnackBar_widget.dart';
import 'package:discipline_committee/Global/Widgets/button_widget.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/Global/Widgets/textField_widget.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/Global/Widgets/txtfield_Round.dart';
import 'package:discipline_committee/Models/AssignPunishmentApi.dart';
import 'package:discipline_committee/Models/ReportApi.dart';
import 'package:discipline_committee/mywidgets/dropdown_search.dart';
import 'package:discipline_committee/screens/Committe_Member/Committee_Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:select2dot1/select2dot1.dart';

import '../../Global/Navigation/Navigater.dart';
import '../../Global/Widgets/textfield_Round_readonly.dart';
import '../../Models/usermodel.dart';
import '../../mywidgets/DropDownController.dart';
import '../../mywidgets/dropdown_controller.dart';
import '../Committe_Member/Report_View_Committee.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_custom_selector/flutter_custom_selector.dart' as sector;
export 'package:image_picker/image_picker.dart';

class NewReport_Screen extends StatefulWidget {
  const NewReport_Screen({super.key});

  @override
  State<NewReport_Screen> createState() => _NewReport_ScreenState();
}

// Initial Selected Value
String? filter = "fm";
// List of items in our dropdown menu

class _NewReport_ScreenState extends State<NewReport_Screen> {
  @override
  void initState() {
    super.initState();
    // getCommittees();
  }

  List<String>? comity;
  Map<String, int>? comityIds;
  int? selectedcomityId;

  DropDownController? dropDownController;

  Future<Map<String, int>> getCommitteesWithIds() async {
    final response = await http.get(Uri.parse('$api/Getcommetiee'));

    if (response.statusCode == 200) {
      final officersJson = jsonDecode(response.body) as List<dynamic>;
      final officers = officersJson.fold<Map<String, int>>({}, (map, officer) {
        final name = officer['title'];
        final userId = officer['com_id'];
        if (name != null && userId != null) {
          return map..[name] = userId;
        } else {
          return map;
        }
      });

      return officers;
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  // List<String> committeeTitles = [];

  // Future<void> getCommittees() async {
  //   try {
  //     var response = await Dio().get('$api/Getcommetiee');

  //     if (response.statusCode == 200) {
  //       if (response.data != 'false') {
  //         List<Map<String, dynamic>> committees =
  //             List<Map<String, dynamic>>.from(response.data);

  //         setState(() {
  //           committeeTitles = committees
  //               .map((committee) => committee["title"].toString())
  //               .toList();
  //         });
  //       } else {
  //         // Handle API error or empty response
  //       }
  //     } else {
  //       // Handle API error
  //     }
  //   } catch (error) {
  //     // Handle network or other errors
  //   }
  // }

  List<String>? users;
  Map<String, int>? usersIds;
  int? selectedUserId;
  SingleCategoryModel? stdsCategory; // Initialize stdsCategory
  SingleCategoryModel? userCategory;
  fetchUsersWithIds(String? usertype) async {
    final response =
        await http.get(Uri.parse('$api/GetReportedBy?usertype=$usertype'));

    if (response.statusCode == 200) {
      final officersJson = jsonDecode(response.body) as List<dynamic>;

      userCategory = SingleCategoryModel(
        nameCategory: usertype == 'fm'
            ? 'Faculty Mem'
            : usertype == 'nfm'
                ? 'Non faculty'
                : 'Student',
        singleItemCategoryList: officersJson
            .map((e) => SingleItemCategoryModel(
                  value: e['u_id'].toString(),
                  extraInfoSingleItem: e['name'],
                  nameSingleItem: e['name'],
                ))
            .toList(),
      );

      // Map<String, int> usersWithIds = {};
      // category.singleItemCategoryList.forEach((item) {
      //   final name = item.nameSingleItem;
      //   final value = item.value;
      //   if (name != null && value != null) {
      //     usersWithIds[name] = int.parse(value);
      //   }
      // });

//      stdsCategory = category; // Assign the value to stdsCategory

      return stdsCategory == null ? null : stdsCategory!;
    } else {
      throw Exception('Failed to fetch users');
    }
  }

//
//
//
  List<String>? stds;

  int? selectedstdId;
  fetchstdsWithIds(String? usertype) async {
    final response =
        await http.get(Uri.parse('$api/GetReportedBy?usertype=$usertype'));

    if (response.statusCode == 200) {
      final officersJson = jsonDecode(response.body) as List<dynamic>;

      stdsCategory = SingleCategoryModel(
        nameCategory: usertype == 'fm'
            ? 'Faculty Mem'
            : usertype == 'nfm'
                ? 'Non faculty'
                : 'Student',
        singleItemCategoryList: officersJson
            .map((e) => SingleItemCategoryModel(
                  value: e['u_id'].toString(),
                  extraInfoSingleItem: e['name'],
                  nameSingleItem: e['username'],
                ))
            .toList(),
      );

      // Map<String, int> usersWithIds = {};
      // category.singleItemCategoryList.forEach((item) {
      //   final name = item.nameSingleItem;
      //   final value = item.value;
      //   if (name != null && value != null) {
      //     usersWithIds[name] = int.parse(value);
      //   }
      // });

//      stdsCategory = category; // Assign the value to stdsCategory

      return stdsCategory == null ? null : stdsCategory!;
    } else {
      throw Exception('Failed to fetch officers');
    }
  }

  File? imageFile;

  TextEditingController test3 = TextEditingController();
  TextEditingController test1 = TextEditingController();
  TextEditingController des_con = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dropDownController = context.read<DropDownController>();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: TextWidget(
              title: "Reported By",
              txtSize: 25,
              txtColor: txtColor,
            ),
          ),
          //backgroundColor: Colors.amber,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      //isThreeLine: true,
                      // subtitle: TextWidget(
                      //     title: "lkjj", txtSize: 15, txtColor: txtColor),
                      contentPadding: EdgeInsets.all(0),
                      title: const Text('Faculty member'),
                      leading: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 93, 63, 143)),
                        value: 'fm',
                        groupValue: filter,
                        onChanged: (value) {
                          filter = value;
                          setState(() {
                            // fetchUsersWithIds(filter);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: const Text('Non Faculty Member'),
                      leading: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 90, 52, 126)),
                        value: 'nfm',
                        groupValue: filter,
                        onChanged: (value) {
                          filter = value;
                          setState(() {
                            // fetchUsersWithIds(filter);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: const Text('Student'),
                      leading: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => btnColor),
                        value: 'std',
                        groupValue: filter,
                        onChanged: (value) {
                          filter = value;
                          setState(() {
                            // fetchUsersWithIds(filter);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FutureBuilder(
                        future: fetchUsersWithIds(filter),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasData) {
                            // usersIds = snapshot.data;
                            // users = usersIds!.keys.toList();

                            return GestureDetector(
                              onTap: () async {
                                // final selectedUser = await showDialog<String>(
                                //   // Show a dialog or dropdown to select the user
                                //   context: context,
                                //   builder: (context) => AlertDialog(
                                //     title: Text('Select User'),
                                //     content: Container(
                                //       width: double.maxFinite,
                                //       child: ListView.builder(
                                //         shrinkWrap: true,
                                //         itemCount: users!.length,
                                //         itemBuilder: (context, index) {
                                //           final user = users![index];
                                //           return ListTile(
                                //             title: Text(user),
                                //             onTap: () {
                                //               Navigator.pop(context,
                                //                   user); // Pass the selected user back to the onTap callback
                                //             },
                                //           );
                                //         },
                                //       ),
                                //     ),
                                //   ),
                                // );

                                // if (selectedUser != null) {
                                //   setState(() {
                                //     selectedUserId = usersIds![selectedUser];
                                //   });
                                // }
                              },
                              child: CustomSelect2dot1(
                                avatarInSingleSelect: true,
                                extraInfoInDropdown: false,
                                isReortedby: true,
                                extraInfoInSingleSelect: false,
                                title: 'Select',
                                scrollController: ScrollController(),
                                data:
                                    userCategory != null ? [userCategory!] : [],
                                isMultiSelect: false,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Text('Error fetching users data');
                          } else {
                            return const SizedBox(); // Placeholder widget when there is no data or error
                          }
                        },
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: FutureBuilder<Map<String, int>>(
                    //     future: fetchUsersWithIds(filter),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.connectionState ==
                    //           ConnectionState.waiting) {
                    //         return const CircularProgressIndicator();
                    //       } else if (snapshot.hasData) {
                    //         usersIds = snapshot.data;
                    //         users = usersIds!.keys.toList();
                    //         return CustomSelect2dot1(
                    //           avatarInSingleSelect: true,
                    //           extraInfoInDropdown: false,
                    //           extraInfoInSingleSelect: false,
                    //           title: 'Select',
                    //           scrollController: ScrollController(),
                    //           data: [stdsCategory!],
                    //           isMultiSelect: false,
                    //         );
                    //       } else if (snapshot.hasError) {
                    //         return const Text('Error fetching users data');
                    //       } else {
                    //         return const SizedBox(); // Placeholder widget when there is no data or error
                    //       }
                    //     },
                    //   ),
                    // ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FutureBuilder(
                        future: fetchstdsWithIds("std"),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // stdsIds = snapshot.data;
                            // stds = stdsIds!.keys.toList();
                            return CustomSelect2dot1(
                              avatarInSingleSelect: true,
                              extraInfoInDropdown: true,
                              isReortedby: false,
                              extraInfoInSingleSelect: false,
                              title: 'Select',
                              scrollController: ScrollController(),
                              data: stdsCategory == null ? [] : [stdsCategory!],
                              isMultiSelect: false,
                            );
                          } else if (snapshot.hasError) {
                            return const Text('Error fetching officers data');
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // InputTxtField(
                    //   label: "Reported Student",
                    //   siconn: Icons.search,
                    //   hintText: "Search",
                    //   controller: test1,
                    //   validator: null,
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    TextWidget(
                      title: "Description",
                      txtSize: 18,
                      txtColor: txtColor,
                    ),
                    MyTextField(
                      controller: des_con,
                      hintText: "Description",
                      obscureText: false,
                      // maxlines: 8,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextWidget(
                          title: "Upload Image",
                          txtSize: 15,
                          txtColor: txtColor,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Container(
                          height: 100,
                          width: 120,
                          color: Color.fromARGB(255, 248, 245, 234),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ButtonWidget(
                              btnText: "Pick Image",
                              onPress: () async {
                                XFile? file = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (file != null) {
                                  imageFile = File(file.path);
                                  //loggedInUser!.uploadPic(imageFile!);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FutureBuilder<Map<String, int>>(
                        future: getCommitteesWithIds(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            comityIds = snapshot.data;
                            comity = comityIds!.keys.toList();
                            return sector.CustomSingleSelectField<String>(
                              title: 'Select Category',
                              items: comity!,
                              onSelectionDone: (value) {
                                final selectedOfficerId =
                                    comityIds![value as String];
                                setState(() {
                                  this.selectedcomityId = selectedOfficerId;
                                });
                              },
                              itemAsString: (item) => item.toString(),
                            );
                          } else if (snapshot.hasError) {
                            return const Text('Error fetching officers data');
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      btnText: "Select Violation Date",
                      onPress: () async {
                        dateTime = await showOmniDateTimePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1600)
                              .subtract(const Duration(days: 3652)),
                          lastDate: DateTime.now().add(
                            const Duration(days: 3652),
                          ),
                          is24HourMode: false,
                          isShowSeconds: false,
                          minutesInterval: 1,
                          secondsInterval: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
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
                      title:
                          '${dateTime != null ? DateFormat('dd-MMM-yyyy\nhh:mm').format(dateTime!) : 'No Date Selected'} ',
                      txtSize: 15,
                      txtColor: txtColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 200,
                      child: ButtonWidget(
                          btnText: "Save",
                          onPress: () async {
                            if (dropDownController!.isReportedbyId != null &&
                                selectedcomityId != "" &&
                                dateTime != "" &&
                                dropDownController!.selectedStudentId != null &&
                                des_con.text != "") {
                              Case c = Case();
                              c.rbId = int.parse(
                                  dropDownController!.isReportedbyId!.value ??
                                      '0');
                              c.stId = int.parse(dropDownController!
                                      .selectedStudentId!.value ??
                                  '0');
                              ;
                              c.comId = selectedcomityId;
                              c.des = des_con.text;
                              //c.img = imageFile!;
                              c.violDate = dateTime;
                              register r = register();
                              r.rtst_id = int.parse(dropDownController!
                                      .selectedStudentId!.value ??
                                  '0');
                              await NewCase(imageFile!, c, r, context);

                              dropDownController!.selectedStudentId = null;
                              dropDownController!.isReportedbyId = null;
                            } else {
                              snackBar(
                                  context, "Please fill all fields correctly");
                            }
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
