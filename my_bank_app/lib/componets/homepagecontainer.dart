import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_bank_app/controller/homecontroller.dart';

class Mycontainer extends StatelessWidget {
  String? title;
  String? cardtype;
  Mycontainer({super.key,required this.title,required this.cardtype});
  @override
  Widget build(BuildContext context) {
   
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        height: 150,
        width: 235,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 0),
                title: Text(title!),
                subtitle: Text('+20.50%'),
                trailing: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(cardtype!)
            ],
          ),
        ));
  }
}
