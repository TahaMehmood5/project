// ignore_for_file: prefer_typing_uninitialized_variables

import '../constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  bool? obscureText = false;
  final Icon? prefixIcon;
  final int? maxlines;
  //final bool readonly;
  //final String? label;
  final IconData? sufixIcon;
  final TextInputType? keytype;
  final Function()? onChanged;
  final Function()? sufixIconPress;

  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText,
    this.prefixIcon,
    this.sufixIcon,
    this.keytype,
    this.maxlines,
    //this.readonly,
    //this.label,
    this.onChanged,
    this.sufixIconPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      //readOnly: readonly!,
      keyboardType: keytype,
      controller: controller,
      obscureText: obscureText!,
      cursorColor: btnColor,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: tabColor,
        // label: Text(
        //   label.toString(),
        //   style: GoogleFonts.gemunuLibre(
        //     fontWeight: FontWeight.w600,
        //     color: const Color.fromARGB(255, 245, 93, 93),
        //     fontSize: 15,
        //   ),
        // ),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        hintStyle: GoogleFonts.gemunuLibre(
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(249, 244, 247, 243),
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: btnColor,
        filled: true,
        suffixIcon: IconButton(
          onPressed: sufixIconPress,
          //Write Actions To Be Done

          icon: Icon(
            sufixIcon,
            //size: 20,
            color: Color.fromARGB(255, 92, 73, 185),
          ),
        ),
      ),
    );
  }
}
