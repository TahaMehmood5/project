// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'dart:io';

import 'package:http/http.dart' as http;

import '../Global/constant.dart';

class User {
  String? name, email, password, usertype;
  //,office_location;
  String? image;
  DateTime? startDate;
  bool? status;
  DateTime? endDate;
  int? sec_id;
  late int user_id;
  //officer
  var sectors;
  User();
  User.fromMap(Map<String, dynamic> map) {
    sec_id = map['sec_id'];
    name = map['name'];
    email = map["email"];
    password = map["password"];
    usertype = map["usertype"];
    image = map["image"];
    user_id = map["u_id"];
    //User
    startDate =
        map['startdate'] != null ? DateTime.parse(map['startdate']) : null;

    endDate = map['enddate'] != null ? DateTime.parse(map['enddate']) : null;
    //officer
  }

  // Future<String?> login() async {
  //   String url = '$api/Login?email=$email&password=$password';
  //   Uri uri = Uri.parse(url);
  //   var response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   }

  //   return null;
  // }

  //Sign up

  // Map<String, dynamic> tomap() {
  //   return <String, dynamic>{
  //     'sec_id': sec_id,
  //     'role': role,
  //     'name': name,
  //     'email': email,
  //     'phone_number': phone_number,
  //     'password': password,
  //     'home_location': home_location,
  // "office_location": office_location,
  // "sec_name": sec_name,
  // "description": sec_description,
  // "startdate": startdate,
  // "status": status,
  // "enddate": enddate,
  //   };
  // }

  // Future<String?> signupMutliPart() async {
  //   String url = '$api/NewUser';
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.fields['role'] = role;
  //   request.fields['name'] = name;
  //   request.fields['email'] = email;
  //   request.fields['phone_number'] = phone_number;
  //   request.fields['password'] = password;

  //   request.fields['home_location'] = home_location;
  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     return response.stream.bytesToString();
  //   }
  //   return null;
  // }

  Future<String?> uploadPic(File f) async {
    String url = '$api/UpdateuserImage';
    Uri uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);
    request.fields["user_id"] = user_id.toString();
    http.MultipartFile newfile =
        await http.MultipartFile.fromPath('image', f.path);
    //loggedInUser!.image = newfile.toString();
    request.files.add(newfile);
    var response = await request.send();
    if (response.statusCode == 200) {
      //loggedInUser!.image = ;
      return 'Uploaded';
    }

    return null;
  }
}

// class UserReset {
//   late String email, newpassword;

//   UserReset();
//   UserReset.fromMap(Map<String, dynamic> map) {
//     email = map["email"];
//     newpassword = map["password"];
//   }
//   Map<String, dynamic> tomap() {
//     return <String, dynamic>{
//       'email': email,
//       'password': newpassword,
//     };
//   }
// }