import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bloc_tutorial/providers/counter_provider.dart';

class CounterProviderEasyExamplePage extends StatelessWidget {
  const CounterProviderEasyExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Provider Easy Example'),
      ),
      body: Column(
        children: [
          const CounterDisplay(),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [CounterUpButton(), CounterDownButton()],
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
    return Text(
      context.watch<CounterProvider>().number.toString(),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class CounterUpButton extends StatelessWidget {
  const CounterUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build of counter button with up');

    return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 55)),
        onPressed: () {
          context.read<CounterProvider>().up();
        },
        child: const Text(
          'Counter ++',
        ));
  }
}

class CounterDownButton extends StatelessWidget {
  const CounterDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build of counter button with down');

    return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 55)),
        onPressed: context.watch<CounterProvider>().down,
        child: const Text('Counter --'));
  }
}
