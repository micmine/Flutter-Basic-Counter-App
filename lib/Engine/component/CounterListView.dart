import 'package:flutter/material.dart';

import '../../Database/Database.dart';
import './CounterView.dart';

class CounterListView extends StatefulWidget {
  @override
  _CounterListViewState createState() => _CounterListViewState();
}

class _CounterListViewState extends State<CounterListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      children: <Widget>[
        _buildCounter(0, "test", 0, Colors.yellow),
        _buildCounter(0, "Rächts", 0, Colors.purple)
      ],
    );
  }

  _buildCounter(int id, String name, int value, Color color) {

    return CounterView(id,name,value,color);
  }


}
