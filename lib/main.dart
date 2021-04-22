import 'package:flutter/material.dart';
import 'package:gallery_app/screen/homePage/home.dart';
import 'constant/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Demo',
      theme: ThemeData(
        accentColor: accentColor,
      ),
      home: HomePage(title: 'Page A'),
    );
  }
}

