import 'dart:async';

import 'package:flutter/material.dart';

class StreamCounterExample extends StatelessWidget {
  StreamCounterExample({Key? key}) : super(key: key);
  final _counterController = CounterController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Controller Example"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            StreamBuilder(
                stream: _counterController.counterStream.stream,
                initialData: _counterController.count,
                builder: (context, snapshot) {
                  return Text(
                    'Count value is : ${snapshot.data}',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  );
                }),
            ElevatedButton(
                onPressed: () {
                  _counterController.upCount();
                },
                child: Text('Count ++')),
            ElevatedButton(
                onPressed: () {
                  _counterController.downCount();
                },
                child: Text('Count --'))
          ],
        ),
      ),
    );
  }
}

class CounterController {
  int count = 10;
  var counterStream = StreamController<int>();

  void upCount() {
    counterStream.sink.add(++count);
  }

  void downCount() {
    counterStream.sink.add(--count);
  }
}
