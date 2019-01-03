import 'package:flutter/material.dart';

import '../Engine.dart';

class MainView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Engine().get(func.Values).appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Engine().get(func.Values).appName),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}