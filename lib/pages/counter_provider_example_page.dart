import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bloc_tutorial/providers/counter_provider.dart';

class CounterProviderExamplePage extends StatelessWidget {
  const CounterProviderExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Provider Example'),
      ),
      body: Column(
        children: [
          CounterDisplay(),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [CounterUpButton(), CounterDownButton()],
          )
        ],
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build of counter display');
    var _counterProvider = Provider.of<CounterProvider>(context, listen: true);
    return Text(
      _counterProvider.number.toString(),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class CounterUpButton extends StatelessWidget {
  const CounterUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build of counter button with up');
    var _counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 55)),
        onPressed: _counterProvider.up,
        child: Text(
          'Counter ++',
        ));
  }
}

class CounterDownButton extends StatelessWidget {
  const CounterDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build of counter button with down');
    var _counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 55)),
        onPressed: _counterProvider.down,
        child: Text('Counter --'));
  }
}
