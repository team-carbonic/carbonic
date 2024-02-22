import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sort_demo/ui/bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late int _barCount;
  late List<int> _orders;
  late List<int> _displayingOrders;
  late List<GlobalKey<BarState>> _barKeys;

  var _stopCalled = false;
  Completer? _isChanging;
  var _isSorting = false;

  @override
  void initState() {
    super.initState();

    _barCount = 50;
    _orders = List.generate(_barCount, (index) => index);
    _displayingOrders = List.from(_orders);
    _barKeys = List.generate(_barCount, (index) => GlobalKey<BarState>());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _orders.shuffle();
                      setState(() {
                        _displayingOrders = List.from(_orders);
                      });
                    },
                    child: Text('shuffle'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _startBubbleSort();
                    },
                    child: Text('bubble sort'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _startInsertionSort();
                    },
                    child: Text('insertion sort'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _startQuickSort();
                    },
                    child: Text('quick sort'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _stop();
                    },
                    child: Text('stop'),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: 300,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: _displayingOrders
                        .asMap()
                        .entries
                        .map(
                          (entry) => Expanded(
                            child: Bar(
                              key: _barKeys[entry.key],
                              index: entry.key,
                              order: entry.value,
                              maxOrder: _barCount - 1,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _stop() async {
    if (_isChanging != null) {
      print('good: stop called');
      _stopCalled = true;
      await _isChanging?.future;
    }
  }

  void _startBubbleSort() async {
    print('good: bubble sort wait');
    await _stop();
    print('good: bubble sort start');

    if (_isSorting) {
      return;
    }
    _isSorting = true;

    try {
      for (var i = 0; i < _barCount - 1; ++i) {
        for (var j = 0; j < _barCount - 1 - i; ++j) {
          if (_orders[j] > _orders[j + 1]) {
            print('good: bubble sort change index called');
            await _changeIndex(j, j + 1);
          }
        }
      }
    } catch (_) {}

    _isSorting = false;
  }

  void _startInsertionSort() async {
    print('good: insertion sort wait');
    await _stop();
    print('good: insertion sort start');

    if (_isSorting) {
      return;
    }
    _isSorting = true;

    try {
      for (var i = 1; i < _barCount; ++i) {
        final key = _orders[i];
        var j = i - 1;
        while (j >= 0 && _orders[j] > key) {
          print('good: bubble sort change index called');
          await _changeIndex(j, j + 1);
          --j;
        }
      }
    } catch (_) {}

    _isSorting = false;
  }

  void _startQuickSort() async {
    await _stop();

    if (_isSorting) {
      return;
    }
    _isSorting = true;

    try {
      await _quickSort(0, _barCount - 1);
    } catch (_) {}

    _isSorting = false;
  }

  Future<void> _quickSort(final int low, final int high) async {
    if (low < high) {
      final pi = await _partition(low, high);
      await _quickSort(low, pi - 1);
      await _quickSort(pi + 1, high);
    }
  }

  Future<int> _partition(final int low, final int high) async {
    final pivot = _orders[high];
    var i = low - 1;
    for (var j = low; j < high; ++j) {
      if (_orders[j] <= pivot) {
        ++i;
        await _changeIndex(i, j);
      }
    }
    await _changeIndex(i + 1, high);
    return i + 1;
  }

  Future<void> _changeIndex(final int from, final int to) async {
    print('good: change index start');
    if (_isChanging != null) {
      await _isChanging?.future;

      print('good: gogogogoogd');
    }

    _isChanging ??= Completer();

    final totalDuration = 50.ms;

    if (from < to) {
      await _swapDisplayingBars(from, to, totalDuration);
    } else if (to < from) {
      await _swapDisplayingBars(to, from, totalDuration);
    }

    final temp = _orders[from];
    _orders[from] = _orders[to];
    _orders[to] = temp;

    _isChanging?.complete();
    _isChanging = null;
    if (_stopCalled) {
      _stopCalled = false;
      throw Exception('stop');
    }
  }

  Future<void> _swapDisplayingBars(
    final int leftIndex,
    final int rightIndex,
    final Duration duration,
  ) async {
    await Future.wait([
      _barKeys[leftIndex].currentState!.forward(
            duration,
            step: rightIndex - leftIndex,
          ),
      _barKeys[rightIndex].currentState!.reverse(
            duration,
            step: rightIndex - leftIndex,
          ),
    ]);

    setState(() {
      _barKeys[leftIndex] = GlobalKey<BarState>();
      _barKeys[rightIndex] = GlobalKey<BarState>();
      final temp = _displayingOrders[leftIndex];
      _displayingOrders[leftIndex] = _displayingOrders[rightIndex];
      _displayingOrders[rightIndex] = temp;
    });

    // 새로운 GlobalKey가 State를 할당받은 후에 다음 로직을 진행하도록 한다.
    final completer = Completer();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _barKeys[leftIndex].currentState!.reset();
      _barKeys[rightIndex].currentState!.reset();
      completer.complete();
    });
    await completer.future;
  }
}
