import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_bank_app/controller/homecontroller.dart';
import 'package:my_bank_app/screens/transcationpage.dart';


class MyCardsPage extends StatelessWidget {
 const MyCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(
                height: 20,
              ),
            const  Text('My Cards'),
              myCardsGridBliulder(),
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
      ),
    );
  }

  myCardsGridBliulder() {
      HomeController homecontroller = Get.put(HomeController());
    return  SizedBox(
      height: 280,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          gridDelegate:
             const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding:const EdgeInsets.all(8),
              child: Container(
                height: 280,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.1),
                    borderRadius:const BorderRadius.all(Radius.circular(7))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'images/pngwing.com.png',
                            height: 25,
                            width: 30,
                          ),
                         const Text('7/22')
                        ],
                      ),
                     const SizedBox(
                        height: 10,
                      ),
                      Text(homecontroller.dataInfo[index].email!),
                      const SizedBox(height: 120,),
                      Text('Balance'),
                      SizedBox(height: 5,),
                      Text(homecontroller.dataInfo[index].balance!.toString())
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

 
}
 myListVeiwBliuder() {
     HomeController homecontroller = Get.put(HomeController());
    return Expanded(
      child: Column(
        children:[ ListView.builder(
          
            shrinkWrap: true,
            itemCount: homecontroller.transcationhistory.length,
            itemBuilder: (context, index) {
              return  ListTile(
                title: Text(homecontroller.transcationhistory[index].email!),
                trailing: Text(homecontroller.transcationhistory[index].amount!.toString()),
              );
            }),
      ]),
    );
  }