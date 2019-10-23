import 'package:flutter/material.dart';
import 'package:picpay_clone_flutter/pages/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xffF4F4F6),
        dialogBackgroundColor: Color(0xffF4F4F6),
        scaffoldBackgroundColor: Color(0xffF4F4F6),
        primaryColor: Color(0xff11C76F),
        cardColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        )
      ),
      home: MyHomePage(),
    );
  }
}