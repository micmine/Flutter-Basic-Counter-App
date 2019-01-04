import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  CounterView(int id, String name, int value, Color color) {


    this.id = id;
    this.name = name;
    this.value = value;
    this.color = color;
  }

  int id;
  String name;
  int value;
  Color color;



  @override
  _CounterViewState createState() => _CounterViewState(this.id, this.name ,this.value, this.color);
}



class _CounterViewState extends State<CounterView> {
  _CounterViewState(int id, String name, int value, Color color){


    this.id = id;
    this.name = name;
    this.value = value;
    this.color = color;
  }

  int id;
  String name;
  int value;
  Color color;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            ),
          ],
        )
    );
  }

  _increase() {
    setState(() {
      value++;
    });
  }

  _decrease() {
    setState(() {
      value--;
    });
  }

}

