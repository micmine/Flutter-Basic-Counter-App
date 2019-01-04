import 'package:flutter/material.dart';

import '../Engine.dart';
import '../../Database/Database.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Data().test();

    Data().connect();

    //Data().insert('insert into counter (name,value) values("test,0)"');

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
        //Todo: count dont works
        child: Engine().get(func.CounterView),
        //child: Text(Data().count("select count(*) from count")),
      ),
    );
  }

  addCounter() {
    print("Adding counter");
  }
}
