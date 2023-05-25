import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class rpform extends StatefulWidget {
  const rpform({super.key});

  @override
  State<rpform> createState() => _rpformState();
}

class _rpformState extends State<rpform> {
  String? v;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reporting form")),
      body: Column(
        children: [
          Row(
            children: [
              RadioListTile(
                  title: Text("data"),
                  value: null,
                  groupValue: null,
                  onChanged: null),
            ],
          )
        ],
      ),
    );
  }
}
