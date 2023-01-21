import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uwang/pages/page_main.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _displayImage() {
    return _displayImageAsset();
  }

  Widget _displayImageAsset() {
    return Image.asset("assets/images/profile.jpg");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
