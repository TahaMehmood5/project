import 'package:discipline_committee/Global/constant.dart';
import 'package:discipline_committee/screens/Admin/tabs.dart';
import 'package:flutter/material.dart';

class Adminscreen extends StatefulWidget {
  const Adminscreen({super.key});

  @override
  State<Adminscreen> createState() => _AdminscreenState();
}

class _AdminscreenState extends State<Adminscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ScfColor,
        title: Text('Admin Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          color: btnColor,
          child: Admintab(),
        ),
      ),
    );
  }
}
