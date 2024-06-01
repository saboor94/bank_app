import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    minimumSize: Size(327, 50),
    elevation: 0,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
    backgroundColor:Colors.transparent.withOpacity(0.1));

class MybuttonText extends StatelessWidget {
  String text;
  MybuttonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }
}
