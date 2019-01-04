import 'package:flutter/material.dart';

import './Engine/Engine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Engine().get(func.Values).appName,
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
