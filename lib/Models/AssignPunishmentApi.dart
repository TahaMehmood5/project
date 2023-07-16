import 'dart:io';

import 'package:dio/dio.dart';
import 'package:discipline_committee/Global/Widgets/SnackBar_widget.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:flutter/material.dart';

class AssignPunishmentApi {
  int? c_id, f_type, pt_id;
  DateTime? start_date, end_date;
  int? f_amount;
  AssignPunishmentApi();
  AssignPunishmentApi.fromMap(Map<String, dynamic> map) {
    c_id = map['c_id'];
    f_type = map["f_type"];
    start_date = map["start_datecription"];
    end_date = map["image"];
    f_amount = map["f_amount"];
    pt_id = map["pt_id"];
  }

  Map<String, dynamic> tomMap() {
    return <String, dynamic>{
      'c_id': c_id,
      'f_type': f_type,
      'start_date': start_date,
      'end_date': end_date,
      'f_amount': f_amount,
      'pt_id': pt_id,
    };
  }

//
//
//
////
  ///
  ///
  ///
  Future<String?> NewCase(AssignPunishmentApi c) async {
    var formData = FormData.fromMap({
      'c_id': c.c_id,
      'f_type': c.f_type,
      'start_date': c.start_date,
      'f_amount': c.f_amount,
      'pt_id': c.pt_id,
      'end_date': c.end_date,
    });
    String url = "$api/AssignPunishment";
    //var v = jsonEncode(AssignPunishmentApi.toMap());
    // post.user = "12";
    var response = await Dio().post(url,
        data: formData,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }));
  }
}

class Case {
  int? rbId, stId, comId;
  String? des, img;
  DateTime? violDate;

  Case({
    this.rbId,
    this.stId,
    this.comId,
    this.des,
    this.img,
    this.violDate,
  });

  factory Case.fromMap(Map<String, dynamic> map) {
    return Case(
      rbId: map['rb_id'],
      stId: map['st_id'],
      comId: map['com_id'],
      des: map['des'],
      img: map['img'],
      violDate: DateTime.parse(map['viol_date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rb_id': rbId,
      'st_id': stId,
      'com_id': comId,
      'des': des,
      'img': img,
      'viol_date': violDate?.toIso8601String(),
    };
  }
}

class register {
  int? rtst_id;
  register({
    this.rtst_id,
  });
  factory register.fromMap(Map<String, dynamic> map) {
    return register(
      rtst_id: map['st_id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'u_id': rtst_id,
    };
  }
}

// Function to upload an image and create a new case
Future<String?> NewCase(File f, Case c, register r, context) async {
  try {
    // Create a new FormData object
    FormData formData = FormData();

    // Add the 'image' file
    formData.files.add(MapEntry('image', await MultipartFile.fromFile(f.path)));

    // Add the 'st_id' field
    formData.fields.add(MapEntry('st_id', c.stId.toString()));

    // Add the 'description' field
    formData.fields.add(MapEntry('description', c.des ?? ''));

    // Add the 'violation_date' field
    formData.fields
        .add(MapEntry('violation_date', c.violDate?.toIso8601String() ?? ''));

    // Add the 'rb_id' field
    formData.fields.add(MapEntry('rb_id', c.rbId.toString()));

    // Add the 'com_id' field
    formData.fields.add(MapEntry('com_id', c.comId.toString()));

    FormData rData = FormData();
    formData.fields.add(MapEntry('st_id', r.rtst_id.toString()));
    final Response = await Dio().post("$api/Registerten", data: rData);
    // Send the request to the API
    final response = await Dio().post("$api/NewCase", data: formData);

    if (response.statusCode == 200) {
      snackBar(context, "Case has been Added Succesfully");
      if (Response.statusCode == 200) {
        snackBar(context, "Alert Register 10 Student");
      }
      return 'Uploaded';
    } else {
      return null;
    }
  } catch (error) {
    return null;
  }
}
