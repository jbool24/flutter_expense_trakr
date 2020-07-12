class Observer {
  final List<Observable> listeners = [];

  void notify() {}
  void register(Observable subject) {}
}

class Observable {
  void update(dynamic payload) {}
}
