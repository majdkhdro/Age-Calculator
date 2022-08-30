// ignore_for_file: prefer_const_constructors
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';

void main() {
  runApp(myapp());
}

// ignore: camel_case_types, use_key_in_widget_constructors
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueGrey,
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Age Calculator')),
        ),
        body: SafeArea(child: myscreen()),
      ),
    );
  }
}
