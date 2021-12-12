import 'package:flutter/material.dart';
import 'package:provider_bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:provider_bloc_tutorial/bloc/counter/counter_event.dart';

class CounterBlocBasicExample extends StatelessWidget {
  CounterBlocBasicExample({Key? key}) : super(key: key);
  final _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<int>(
                initialData: 0,
                stream: _counterBloc.count,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  );
                }),
            ElevatedButton(
                onPressed: () {
                  _counterBloc.counterEventSink.add(UpCount());
                },
                child: const Text('Count ++')),
            ElevatedButton(
                onPressed: () {
                  _counterBloc.counterEventSink.add(DownCount());
                },
                child: const Text('Count ++'))
          ],
        ),
      ),
    );
  }
}
