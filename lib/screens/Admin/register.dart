import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Global/Widgets/constant.dart';
import '../../Global/Widgets/text_widget.dart';

class registerten extends StatefulWidget {
  const registerten({super.key});

  @override
  State<registerten> createState() => _registertenState();
}

class _registertenState extends State<registerten> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          title: "Register 10",
          txtSize: 25,
          txtColor: txtColor,
        ),
      ),
    );
  }
}