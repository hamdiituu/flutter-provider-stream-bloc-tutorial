import 'dart:async';

import 'package:provider_bloc_tutorial/bloc/counter/counter_event.dart';

class CounterBloc {
  int _count = 0;

  //Stream Controllers
  final _counterStateController = StreamController<int>();
  Stream<int> get count => _counterStateController.stream;

  //Stream Events
  final _counterEventController = StreamController<CounterEvent>();

  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen((CounterEvent event) {
      if (event is UpCount) {
        _count += 1;
      } else {
        _count -= 1;
      }
      _counterStateController.sink.add(_count);
    });
  }
}
