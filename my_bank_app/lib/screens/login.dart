import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_bank_app/componets/myElvatedButton.dart';
import 'package:my_bank_app/componets/mytextFeild.dart';
import 'package:my_bank_app/controller/homecontroller.dart';
import 'package:my_bank_app/screens/signup.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  HomeController homeControl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(),
      body: 
         Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Username'),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: homeControl.emailcontroller,
                    hintText: 'Username',
                    obscureText: false),
                const SizedBox(
                  height: 20,
                ),
                const Text('Password'),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: homeControl.passwordcontroller,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                      style: buttonPrimary,
                      onPressed: () {
                        homeControl.login();
                      },
                      child: MybuttonText(text: 'Login')),
                ),
                SizedBox(height: 10,),
                Center(
                  child: ElevatedButton(
                      style: buttonPrimary,
                      onPressed: () {
                         Get.off(() =>Signup());
                      },
                      child: MybuttonText(text: 'Sign up')),
                ),
              ],
            ),
          ),
    
    );
  }
}
