// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:vendingmachine_app/home/designGUI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: AppBarTheme(foregroundColor: Colors.white,backgroundColor: Colors.deepPurple)),
      title: "แอป ตู้ขายของอัตโนมัติ",
      home: VendingMachineGUI(),
    );
  }
}

