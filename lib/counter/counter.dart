class Counter {
  int _count = 0;

  int get count => _count;

  void incrementCounter() => _count += 1;

  void decrementCounter() => _count -= 1;

  void reset() => _count = 0;
}
