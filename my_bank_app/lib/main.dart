import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_bank_app/screens/login.dart';
import 'package:my_bank_app/screens/myCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: GetMaterialApp(
        theme: ThemeData.dark(),
        home: LoginPage()),
    );
  }
}
