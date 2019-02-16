import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterView extends StatefulWidget {
  CounterView(int id, String name, Color color) {
    this.id = id;
    this.name = name;
    //this.value = value;
    this.color = color;
  }

  int id;
  String name;

  //int value;
  Color color;

  @override
  _CounterViewState createState() =>
      _CounterViewState(this.id, this.name, this.color);
}

class _CounterViewState extends State<CounterView> {
  _CounterViewState(int id, String name, Color color) {
    this.id = id;
    this.name = name;
    //this.value = value;
    this.value = 0;
    this.color = color;
  }

  int id;
  String name;
  int value;
  Color color;

  @override
  Widget build(BuildContext context) {
    initValue();
    return Container(
        alignment: AlignmentDirectional.center,
        color: color,
        child: Column(
          children: <Widget>[
            Text(name.toString()),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 100.0, color: Colors.white),
            ),
            RaisedButton(
              child: Text("increase"),
              onPressed: _increase,
            ),
            RaisedButton(
              child: Text("decrease"),
              onPressed: _decrease,
            )
          ],
        ));
  }

  _increase() {
    setState(() {
      value++;
    });
    _save();
  }

  _decrease() {
    setState(() {
      value--;
    });
    _save();
  }

  _save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter-' + id.toString());
    print('Pressed $counter times.');
    await prefs.setInt('counter-' + id.toString(), value);
    print('|-| Pressed $counter times.');
  }

  initValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      this.value = prefs.getInt('counter-' + id.toString());
    });
  }
}
