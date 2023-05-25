import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback onPress;

  const ButtonWidget({super.key, required this.btnText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shadowColor: Color.fromARGB(255, 168, 152, 250),
        //primary: Theme.of(context).secondaryHeaderColor,
        backgroundColor: Color.fromARGB(255, 92, 73, 185),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text(
        btnText.toUpperCase(),
        style: GoogleFonts.gemunuLibre(
          fontSize: 15,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }
}
