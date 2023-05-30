import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/Global/Widgets/tester.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/Global/Widgets/txtfield_Round.dart';
import 'package:discipline_committee/mywidgets/button.dart';
import 'package:discipline_committee/screens/Student/DropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:intl/intl.dart';

import 'DropDownViolation.dart';

class AppealForm_Screen extends StatefulWidget {
  const AppealForm_Screen({super.key});

  @override
  State<AppealForm_Screen> createState() => _AppealForm_ScreenState();
}

class _AppealForm_ScreenState extends State<AppealForm_Screen> {
  TextEditingController commentContr = TextEditingController();
  DateTime? FromDate;
  DateTime? ToDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          title: "Appeal Form",
          txtSize: 28,
          txtColor: txtColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Divider(
              color: btnColor,
              height: 2,
              thickness: 4,
            ),
            SizedBox(
              height: 15,
            ),
            TextWidget(title: "Punishment", txtSize: 20, txtColor: txtColor),
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
            // TextWidget(
            //   title: "Assgined By",
            //   txtSize: 20,
            //   txtColor: txtColor,
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TestDropDown(),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title: "Assgined By :  ",
                    txtSize: 20,
                    txtColor: txtColor,
                  ),
                  TextWidget(
                    title: "Umar Farooq",
                    txtSize: 20,
                    txtColor: txtColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title: "From:  ",
                    txtSize: 20,
                    txtColor: txtColor,
                  ),
                  TextWidget(
                    title: "03-05-2023",
                    txtSize: 20,
                    txtColor: txtColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title: "To:  ",
                    txtSize: 20,
                    txtColor: txtColor,
                  ),
                  TextWidget(
                    title: "11-05-2023",
                    txtSize: 20,
                    txtColor: txtColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextWidget(
              title: "Add comments",
              txtSize: 20,
              txtColor: txtColor,
            ),
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
                btnText: "Submit",
                onPress: () {
                  getDialogue(context);
                })
          ],
        ),
      ),
    );
  }
}
