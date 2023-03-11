class Counter {
  int _count = 0;

  get state => _count;

  void increment() {
    _count++;
  }

  void decrement() {
    _count--;
  }
}
