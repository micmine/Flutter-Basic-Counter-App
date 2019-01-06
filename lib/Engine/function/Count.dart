import 'package:flutter/material.dart';

class Count {
  Count();

  int id;
  String name;
  int value;
  Color color;

  static final columns = ["id", "name", "value", "color"];

  Map toMap() {
    Map map = {
      "id": id,
      "name": name,
      "value": value,
      "color": color
    };

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map) {
    Count count = new Count();
    count.id = map["id"];
    count.name = map["name"];
    count.value = map["value"];
    count.color = map["count"];

    return count;
  }
}