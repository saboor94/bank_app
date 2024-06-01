import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_bank_app/screens/bottomNavi.dart';

class DataInfo {
  String? email;
  String? password;
  int? balance;
  int? totalExpense;
  int? income;
  List Transcationhistory = [];
  DataInfo(email, password, balance, income, totalExpense) {
    this.email = email;
    this.password = password;
    this.balance = balance;
    this.income = income;
    this.totalExpense = totalExpense;
  }
}

class Transcationhistory {
  String? email;
  int? amount;
  Transcationhistory(this.email, this.amount);
}

List<DataInfo> dataInfo = [
  DataInfo('saboor@gmail.com', '123456', 20000, 20000, 0),
  DataInfo('saboor1@gmail.com', '123456', 40000, 40000, 0),
  DataInfo('saboor2@gmail.com', '123456', 30000, 30000, 0),
];

class HomeController extends GetxController {
  List<DataInfo> dataInfo = [
    DataInfo('saboor@gmail.com', '123456', 20000, 20000, 0),
    DataInfo('saboor1@gmail.com', '123456', 40000, 40000, 0),
    DataInfo('saboor2@gmail.com', '123456', 30000, 30000, 0),
  ];
  List<Transcationhistory> transcationhistory = [];
  var currentuser;
  var currentEmail;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();
  TextEditingController dipositMoney = TextEditingController();
  TextEditingController transferMoneyEmail = TextEditingController();
  TextEditingController transferMoneyAmount = TextEditingController();
  login() {
    for (var data in dataInfo) {
      if (emailcontroller.text == data.email &&
          passwordcontroller.text == data.password) {
        currentuser = data;
        currentEmail = data.email;
        Get.snackbar('Login', "");
        Get.offAll(() => const MyBottomNavigator());
        return;
      }
    }
    Get.snackbar('Incorrect', "Email or Password");
    emailcontroller.clear();
    passwordcontroller.clear();
    update();
  }

  signup() {
    if (passwordcontroller.text == confrimPasswordController.text &&
        emailcontroller.text != '' &&
        passwordcontroller.text != '') {
      for (var data in dataInfo) {
        if (emailcontroller.text == data.email) {
          Get.snackbar('Email', "Already exits");
          return;
        }
      }

      dataInfo.add(
          DataInfo(emailcontroller.text, passwordcontroller.text, 0, 0, 0));
      for (var data in dataInfo) {
        if (emailcontroller.text == data.email) {
          currentuser = data;
        }
      }

      Get.snackbar('Login', "");
      Get.offAll(() => const MyBottomNavigator());
    } else if (passwordcontroller.text != confrimPasswordController.text) {
      Get.snackbar('Password', "does not match ");
      return;
    }

    update();
  }

  dipositMoneys(email) {
    if (dipositMoney.text != '') {
      for (var data in dataInfo) {
        if (email == data.email) {
          data.balance = data.balance! + int.parse(dipositMoney.text);
          Get.snackbar('Amount', "Diposited");
        }
      }
    }
    Get.back;
    update();
  }

  transfermoneys(transferEmail, currentuser) {
    if (currentuser.balance - int.parse(transferMoneyAmount.text) > 0) {
      transferEmail.balance =
          transferEmail.balance + int.parse(transferMoneyAmount.text);
      transcationhistory.add(Transcationhistory(
          transferEmail.email, int.parse(transferMoneyAmount.text)));
      for (var data in dataInfo) {
        if (currentuser.email == data.email) {
          data.balance = (data.balance! - int.parse(transferMoneyAmount.text));
          data.totalExpense =
              (data.totalExpense! + int.parse(transferMoneyAmount.text));
          Get.snackbar('Amount', "Transfered");
        }
      }
    } else {
      Get.snackbar('Entered', "Invaild Amount");
    }

    Get.back;
    update();
  }
}
