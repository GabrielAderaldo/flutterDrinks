import 'dart:io';

import 'package:apk_bebidas/ViewController/home_view_controller.dart';
import 'package:apk_bebidas/utils/problems.dart';
import 'package:flutter/material.dart';

import 'ViewController/menu_view_controller.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}
