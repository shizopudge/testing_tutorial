import 'package:flutter/material.dart';

import 'counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final Counter _counter = Counter();

  void incrementCounter() {
    setState(() => _counter.incrementCounter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment-counter-button'),
        onPressed: incrementCounter,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: Text(
          'Count: ${_counter.count}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
