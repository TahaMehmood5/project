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

// Function to create a new case
Future<String> createNewCase() async {
  try {
    // Replace 'YOUR_API_URL' with the actual API endpoint URL
    const String apiUrl = 'YOUR_API_URL';

    // Create a new Dio instance
    final dio = Dio();

    // Send a multipart request with the image file
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile('path_to_image_file'),
      'st_id': 1, // Replace with the actual value of 'st_id'
      'description': 'Some description', // Replace with the actual description
      'violation_date': '2023-06-11', // Replace with the actual violation date
      'rb_id': 1, // Replace with the actual value of 'rb_id'
      'com_id': 1, // Replace with the actual value of 'com_id'
    });

    final response = await dio.post(apiUrl, data: formData);

    if (response.statusCode == 200) {
      return 'New case created successfully!';
    } else {
      return 'Failed to create a new case';
    }
  } catch (error) {
    return 'Error: $error';
  }
}
