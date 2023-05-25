import 'package:discipline_committee/Global/Widgets/text_widget.dart';

import 'constant.dart';
import 'package:flutter/material.dart';

getDialogue(context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              icon: const Icon(Icons.cancel),
            ),
          ],
        ),
        Center(
          child: TextWidget(
            title: "Working",
            txtSize: 30,
            txtColor: btnColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
