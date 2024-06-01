import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  dynamic icon;
  MyCircleAvatar({super.key, required this.icon});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:  Colors.transparent.withOpacity(0.1),
      child: Icon(icon,color: Colors.white,),
    );
  }
}
