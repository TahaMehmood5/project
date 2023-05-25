import 'dart:isolate';

import 'package:discipline_committee/screens/Committe_Member/Report_View.dart';
import 'package:discipline_committee/screens/Committe_Member/dashboard.dart';
import 'package:discipline_committee/screens/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      //home: const LoginScreen(),
      //home: CommitteeDashoard_Screen(),
      home: LoginScreen(),
    );
  }
}
