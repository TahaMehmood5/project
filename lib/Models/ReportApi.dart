import 'package:discipline_committee/Global/Navigation/Navigater.dart';
import 'package:discipline_committee/screens/Admin/tabs.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../Global/Widgets/SnackBar_widget.dart';
import '../Global/constant.dart';
import 'usermodel.dart';

reportedby(name, context) async {
  var response = await Dio().get(
    '$api/GetReportedBy?usertype=$name',
  );

  if (response.statusCode == 200) {
    //log(response.data);
    if (response.data != 'false') {
    } else {
      snackBar(context, "Incorrect Email or Password.");
    }
  } else {
    return null;
  }
}

class User {
  int? u_id;
  String? name, username, email, password, usertype;

  User({
    required this.u_id,
    required this.name,
    required this.username,

    // required this.email,
    required this.password,
    required this.usertype,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      u_id: json['u_id'],
      name: json['name'],
      username: json['username'],
      //email: json['email'],
      password: json['password'],
      usertype: json['usertype'],
    );
  }
}
