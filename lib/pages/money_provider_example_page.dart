import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bloc_tutorial/providers/counter_provider.dart';
import 'package:provider_bloc_tutorial/providers/money_provider.dart';

class MoneyProviderExamplePage extends StatelessWidget {
  const MoneyProviderExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Provider Example Page'),
      ),
      body: Column(
        children: [
          const MoneyDisplay(),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [MoneyAddButton(), MoneyClearButton()],
          )
        ],
      ),
    );
  }
}

class MoneyDisplay extends StatelessWidget {
  const MoneyDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build of counter display');
    //var _counterProvider = Provider.of<CounterProvider>(context, listen: true);
    return Text(
      //_counterProvider.number.toString(),
      context.watch<MoneyProvider>().totalMoney.toString(),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class MoneyAddButton extends StatelessWidget {
  const MoneyAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build of counter button with up');
    //var _counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 55)),
        onPressed: () => context.read<MoneyProvider>().addMoney(10),
        //onPressed: _counterProvider.up,
        child: Text(
          'Money Add Button',
        ));
  }
}

class MoneyClearButton extends StatelessWidget {
  const MoneyClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build of counter button with down');
    var _moneyProvider = Provider.of<MoneyProvider>(context, listen: false);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 55)),
        onPressed: _moneyProvider.clearMoney,
        //onPressed: _counterProvider.down,
        child: Text('Money Clear'));
  }
}
