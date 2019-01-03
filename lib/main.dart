import 'package:flutter/material.dart';
import './Engine/Engine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        //Todo: Setting: Darkmode
      ),
      home: Engine().get(func.MainView),
    );
  }
}
