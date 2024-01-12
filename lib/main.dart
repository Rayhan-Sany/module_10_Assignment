import 'package:flutter/material.dart';
import 'package:module_10_assignment/my_Bag.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Module_10_Assignment',
      debugShowCheckedModeBanner: false,
      home: MyBagPage(),
    );
  }
}
