import './function/Count.dart';
import './function/Values.dart';

import './component/MainView.dart';
import './component/CounterListView.dart';

class Engine {
  get(func witch) {
    if (witch == func.Count) {
      return Count();
    } else if (witch == func.Values) {
      return Values();
    } else if (witch == func.MainView) {
      return MainView();
    } else if (witch == func.CounterView) {
      return CounterListView();
    } else {
      return "Coud not find such a function/component";
    }
  }
}

enum func {
  Count,
  Values,
  MainView,
  CounterView
}