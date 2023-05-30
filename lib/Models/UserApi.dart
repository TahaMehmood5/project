import 'package:discipline_committee/Global/Navigation/Navigater.dart';
import 'package:discipline_committee/screens/Admin/tabs.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../Global/Widgets/SnackBar_widget.dart';
import '../Global/constant.dart';
import 'usermodel.dart';

login(email, password, context) async {
  var response = await Dio().get(
    '$api/login?email=$email&password=$password',
  );

  if (response.statusCode == 200) {
    //log(response.data);
    if (response.data != 'false') {
      final List<dynamic> dataList = response.data;

      // Parse the first item in the list as a Map
      final Map<String, dynamic> dataMap = dataList.first;

      // Create a new User object from the map
      loggedInUser = User.fromMap(dataMap);

      // Navigate to dashboard screen with loggedInUser data
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Nav_Bar(),
        ),
      );
    } else {
      snackBar(context, "Incorrect Email or Password.");
    }
  } else {
    return null;
  }
}
