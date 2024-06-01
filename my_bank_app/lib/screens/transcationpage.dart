import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank_app/componets/myElvatedButton.dart';
import 'package:my_bank_app/componets/mytextFeild.dart';
import 'package:my_bank_app/controller/homecontroller.dart';
import 'package:my_bank_app/screens/bottomNavi.dart';

class TranscationPage extends StatefulWidget {
  const TranscationPage({super.key});

  @override
  State<TranscationPage> createState() => _TranscationPageState();
}

HomeController homeController = Get.put(HomeController());

class _TranscationPageState extends State<TranscationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (cahomeControlca) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    openDailogDiposit();
                  },
                  child: MybuttonText(text: 'Want to Diposit')),
                  SizedBox(height: 10,),
              ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    openDailogtranfer();
                  },
                  child: MybuttonText(text: 'Want to transfer')),
            ],
          ),
        );
      }),
    );
  }

  openDailogDiposit() => Get.defaultDialog(
        title: 'Diposit Money',
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            width: 400,
            child: Column(
              children: [
                MyTextField(
                    controller: homeController.dipositMoney,
                    hintText: 'Amount To Diposit',
                    obscureText: false)
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                homeController.dipositMoneys(homeController.currentuser.email);
                
              },
              child: const Icon(Icons.send))
        ],
      );

  openDailogtranfer() => Get.defaultDialog(
        title: ('Transfer Money'),
        content: Container(
          height: 220,
          width: 220,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: homeController.dataInfo.length,
              itemBuilder: (context, index) {
                // if (homeController.currentuser.email !=
                //     homeController.dataInfo[index].email) {
                return ListTile(
                  title: Text(homeController.dataInfo[index].email!),
                  trailing: IconButton(
                      onPressed: () {
                        openDailogtransferAmount(
                            homeController.dataInfo[index]);
                      },
                      icon: Text('Transfer')),
                );
                // }
                // return null;
              }),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back;
              },
              child: const Icon(Icons.send))
        ],
      );
  openDailogtransferAmount(email) => Get.defaultDialog(
        title: 'Transfer Money',
        content: Container(
          height: 150,
          width: 150,
          child: MyTextField(
              controller: homeController.transferMoneyAmount,
              hintText: 'Amount to Transfer',
              obscureText: false),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                homeController.transfermoneys(
                    email, homeController.currentuser);
                Get.back;
              },
              child: const Icon(Icons.send))
        ],
      );
}
