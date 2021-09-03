import 'package:chatapp/pages/header.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat app',
      theme: ThemeData(
        // backgroundColor: Colors.white,
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: header(),
    );
  }
}
