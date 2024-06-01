import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank_app/componets/circleavatar.dart';
import 'package:my_bank_app/componets/homepagecontainer.dart';
import 'package:my_bank_app/controller/homecontroller.dart';
import 'package:my_bank_app/screens/myCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   HomeController homeControl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            myRowofCricleAvatar(),
            const SizedBox(
              height: 30,
            ),
            const Text('Good Morning'),
            const Text(
              'Alofonso Calzoni',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            myRowOfCards(),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color:Colors.transparent.withOpacity(0.1),
                    borderRadius:
                       const BorderRadius.vertical(top: Radius.circular(20))),
                child: Column(
                  children: [
                   const Text(
                      '________',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                   const SizedBox(height: 5,),
                     Text('Transcation history' ,),
                     myListVeiwBliuder(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  myRowofCricleAvatar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyCircleAvatar(icon: Icons.add),
        const SizedBox(
          width: 330,
        ),
        MyCircleAvatar(icon: Icons.notifications_none_outlined),
        MyCircleAvatar(icon: Icons.person)
      ],
    );
  }

  myRowOfCards() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Mycontainer(title:homeControl.currentuser.balance.toString(), cardtype:'Balance'),
           Mycontainer(title: homeControl.currentuser.income.toString(), cardtype: 'Income')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Mycontainer(title: homeControl.currentuser.totalExpense.toString(),cardtype: 'Expense',),
            Mycontainer(title:homeControl.currentuser.totalExpense.toString(),cardtype: 'Expense',) ,
          ],
        )
      ],
    );
  }
}
