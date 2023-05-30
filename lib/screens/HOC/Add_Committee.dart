import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/Global/Widgets/tester.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/Global/Widgets/txtfield_Round.dart';
import 'package:discipline_committee/mywidgets/button.dart';
import 'package:discipline_committee/screens/Student/DropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Student/DropDownViolation.dart';

class AddCommittee_Screen extends StatefulWidget {
  const AddCommittee_Screen({super.key});

  @override
  State<AddCommittee_Screen> createState() => _AddCommittee_ScreenState();
}

class _AddCommittee_ScreenState extends State<AddCommittee_Screen> {
  TextEditingController commentContr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          title: "Add Committee",
          txtSize: 18,
          txtColor: txtColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextWidget(
                title: "Select Category",
                txtSize: 20,
                txtColor: txtColor,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ViolationDropDown(),
              ),
              SizedBox(
                height: 15,
              ),
              TextWidget(
                title: "Select Committee Members",
                txtSize: 20,
                txtColor: txtColor,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TestDropDown(),
              ),
              SizedBox(
                height: 15,
              ),
              TextWidget(
                  title: "Add comments", txtSize: 20, txtColor: txtColor),
              SizedBox(
                height: 15,
              ),
              MyTextField(
                maxlines: 5,
                obscureText: false,
                controller: commentContr,
                hintText: "Comments",
              ),
              SizedBox(
                height: 15,
              ),
              ButtonWidget(
                  btnText: "Save",
                  onPress: () {
                    getDialogue(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
