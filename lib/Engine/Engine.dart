import './function/count.dart';
import './function/Values.dart';
import './component/MainView.dart';

class Engine {
  get(func witch) {
    if (witch == func.Count) {
      return Count();
    } else if (witch == func.Values) {
      return Values();
    } else if (witch == func.MainView) {
      return MainView();
    } else {
      return "Coud not find such a function/component";
    }
  }
}

enum func {
  Count,
  Values,
  MainView
}