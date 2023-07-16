import 'dart:isolate';

import 'package:discipline_committee/mywidgets/DropDownController.dart';
import 'package:discipline_committee/screens/Committe_Member/Report_View_Committee.dart';
import 'package:discipline_committee/screens/Committe_Member/Committee_Dashboard.dart';
import 'package:discipline_committee/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DropDownController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        //home: const LoginScreen(),
        //home: CommitteeDashoard_Screen(),
        home: LoginScreen(),
      ),
    );
  }
}
