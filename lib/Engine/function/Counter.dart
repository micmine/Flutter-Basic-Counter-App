import '../../Database/Database.dart';

class Counter {
  create(String name) {
    Data().insert("insert into Count(name,value) values(" + name +",0)");
    print("Added new counter with the name:" + name);
  }

  delete() {

  }

  increase(id) {
    Data().update("update count set value = " + (Data().count("SELECT COUNT(*) FROM count") + 1) + "where id = " + id);
  }

  decrease(int id) {

  }

  getCount(int id) {

  }
}