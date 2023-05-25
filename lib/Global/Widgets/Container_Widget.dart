import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  MaterialColor? color;
  var ontap;
  bool? isSmall;
  IconData? icon;
  String? heading;
  String? subtitle;
  MyContainer({
    Key? key,
    required this.color,
    this.isSmall = false,
    required this.icon,
    this.ontap,
    required this.heading,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color![400],
          boxShadow: [
            BoxShadow(
              color: color!.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 4,
              offset: const Offset(2, 6),
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              color![400]!,
              color![300]!,
              color![200]!,
            ],
            stops: const [
              0.4,
              0.6,
              1,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: isSmall! ? Alignment.centerLeft : Alignment.center,
              child: Icon(
                icon,
                size: isSmall! ? 60 : 120,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              heading!,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "$subtitle",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
