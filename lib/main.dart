import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:module_10_assignment/my_bag.dart';

void main()=> runApp(DevicePreview(
  enabled: true,
  builder: (context) {
    return const MyApp();
  }
));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Module_10_Assignment',
      debugShowCheckedModeBanner: false,
      home: MyBagPage(),
    );
  }
}
