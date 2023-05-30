import 'package:discipline_committee/Global/Navigation/Navigater.dart';
import 'package:discipline_committee/Global/Widgets/SnackBar_widget.dart';
import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/Models/UserApi.dart';
import 'package:discipline_committee/screens/Admin/admin.dart';
import 'package:discipline_committee/mywidgets/button.dart';
import 'package:discipline_committee/mywidgets/inputtextbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController Username = TextEditingController();
    TextEditingController Password = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "assets/logoBiit.jpeg",
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Discipline Committee Assistant",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w900,
                    color: txtColor,
                    fontSize: 20,
                  ),
                ),
                // SizedBox(
                //   height: 30,
                // ),
                // Text(
                //   "Login",
                //   style: GoogleFonts.lato(
                //     fontWeight: FontWeight.w700,
                //     color: bkColor,
                //     fontSize: 20,
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),
                InputTxtField(
                  keytype: TextInputType.text,
                  hintText: "Enter Your UserName ",
                  siconn: Icons.person,
                  controller: Username,
                  validator: null,
                  label: "UserName",
                ),
                SizedBox(
                  height: 30,
                ),
                InputTxtField(
                  keytype: TextInputType.visiblePassword,
                  siconn: Icons.password_outlined,
                  label: "Password",
                  hintText: "Enter Password",
                  controller: Password,
                  validator: null,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ButtonWidget(
                    btnText: "Login",
                    onPress: () {
                      if (Username.text != "" && Password.text != "") {
                        login(Username.text, Password.text, context);
                      } else {
                        snackBar(context, "Please Enter Username & Password");
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
