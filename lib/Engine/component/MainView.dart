import 'package:flutter/material.dart';

import '../Engine.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(Engine().get(func.Values).appName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            splashColor: Colors.white,
            onPressed: addCounter(),
          )
        ],
      ),
      body: Center(
        child: Engine().get(func.CounterView),
      ),
    );
  }

  addCounter() {
    print("Adding counter");
  }
}
