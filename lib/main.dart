import 'package:flutter/material.dart';
import 'package:flutter_attimuitehoi_app/view/JankenPage.dart';
import 'package:flutter_attimuitehoi_app/view/TopPage.dart';
import 'package:flutter_attimuitehoi_app/view/screan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopPage(),
    );
  }
}
