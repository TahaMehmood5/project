import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTxtField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  String? label;
  IconData? siconn;
  TextInputType? keytype;

  InputTxtField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.siconn,
    this.keytype,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //keyboardType: TextInputType.emailAddress,
      keyboardType: keytype,
      cursorColor: Color.fromARGB(255, 92, 73, 185),
      controller: controller,
      validator: validator,
      obscureText: false,

      style: GoogleFonts.gemunuLibre(
        color: Color.fromARGB(255, 22, 16, 16),
        fontSize: 15,
      ),
      decoration: InputDecoration(
        label: Text(
          label.toString(),
          style: GoogleFonts.gemunuLibre(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        // enabledBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     width: 2,
        //     color: Color.fromARGB(255, 131, 242, 131),
        //   ),
        // ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Color.fromARGB(255, 92, 73, 185),
          ),
        ),
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: GoogleFonts.gemunuLibre(
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 17, 10, 10),
          fontSize: 15,
        ),
        suffixIcon: Icon(
          siconn,
          size: 20,
          color: Color.fromARGB(255, 92, 73, 185),
        ),
      ),
    );
  }
}
