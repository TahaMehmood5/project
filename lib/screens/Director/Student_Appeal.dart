import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/Global/Widgets/tester.dart';
import 'package:discipline_committee/Global/Widgets/text_widget.dart';
import 'package:discipline_committee/Global/Widgets/textfield_Round_readonly.dart';
import 'package:discipline_committee/Global/Widgets/txtfield_Round.dart';
import 'package:discipline_committee/mywidgets/button.dart';
import 'package:discipline_committee/screens/Student/DropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:intl/intl.dart';

class StudentAppeal_Screen extends StatefulWidget {
  const StudentAppeal_Screen({super.key});

  @override
  State<StudentAppeal_Screen> createState() => _StudentAppeal_ScreenState();
}

class _StudentAppeal_ScreenState extends State<StudentAppeal_Screen> {
  TextEditingController commentContr = TextEditingController();
  TextEditingController DcommentContr = TextEditingController();
  DateTime? FromDate;
  DateTime? ToDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          title: "Student Appeal",
          txtSize: 28,
          txtColor: txtColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
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
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      title: "Student Name:  ",
                      txtSize: 20,
                      txtColor: txtColor,
                    ),
                    TextWidget(
                      title: "Taha Mehmood",
                      txtSize: 20,
                      txtColor: txtColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
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
                      title: "Arid NO. :  ",
                      txtSize: 20,
                      txtColor: txtColor,
                    ),
                    TextWidget(
                      title: "2019-ARID-3106",
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
                      title: "Punishment:  ",
                      txtSize: 20,
                      txtColor: txtColor,
                    ),
                    TextWidget(
                      title: "Fighting",
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
                      title: "Assgined By:  ",
                      txtSize: 20,
                      txtColor: txtColor,
                    ),
                    TextWidget(
                      title: "Umer Farooq",
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
                      title: "12-05-2023",
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
                title: "Student Comment",
                txtSize: 20,
                txtColor: txtColor,
              ),
              SizedBox(
                height: 15,
              ),
              MyTextField_ReadOnly(
                maxlines: 5,
                readonly: true,
                //sobscureText: false,
                controller: commentContr,
                hintText:
                    "Please Reduce my Punishment . I will be very grateful to you",
              ),
              SizedBox(
                height: 15,
              ),
              TextWidget(
                title: "Director's Comment To HOC",
                txtSize: 20,
                txtColor: txtColor,
              ),
              SizedBox(
                height: 15,
              ),
              MyTextField(
                maxlines: 5,
                obscureText: false,
                controller: DcommentContr,
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
      ),
    );
  }
}
