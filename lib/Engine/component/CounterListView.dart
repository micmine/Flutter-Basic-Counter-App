import 'package:flutter/material.dart';

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
        _buildCounter(0, "left", Colors.yellow),
        _buildCounter(1, "right", Colors.purple)
      ],
    );
  }

  _buildCounter(int id, String name, Color color) {
    return CounterView(id,name,color);
  }
}
