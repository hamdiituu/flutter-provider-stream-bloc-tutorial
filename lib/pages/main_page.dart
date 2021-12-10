import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider / Bloc Tutorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55)),
                onPressed: () {
                  Navigator.of(context).pushNamed('/counter_provider_example');
                },
                icon: const Icon(Icons.countertops),
                label: const Text('Counter Provider Example')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55)),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/counter_provider_easy_example');
                },
                icon: const Icon(Icons.countertops),
                label: const Text('Counter Provider Easy Example')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55)),
                onPressed: () {
                  Navigator.of(context).pushNamed('/money_provider_example');
                },
                icon: const Icon(Icons.money),
                label: const Text('Money Provider Example')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55)),
                onPressed: () {
                  Navigator.of(context).pushNamed('/auth_provider_example');
                },
                icon: const Icon(Icons.person),
                label: const Text('Auth Provider Example'))
          ],
        ),
      ),
    );
  }
}
