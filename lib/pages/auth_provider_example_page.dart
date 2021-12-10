import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:provider_bloc_tutorial/providers/auth_provider.dart';

class AuthProviderExamplePage extends StatelessWidget {
  const AuthProviderExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Provider Example"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            AuthStatusText(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => context.read<AuthProvider>().login(true),
                child: Text('Set Success Login')),
            ElevatedButton(
                onPressed: () => context.read<AuthProvider>().login(false),
                child: Text('Set Fail Login')),
            ElevatedButton(
                onPressed: () => context.read<AuthProvider>().logout(),
                child: Text('Set Logout')),
            ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed('/auth_provider_protected_example'),
                child: Text('Go to protected page')),
          ],
        ),
      ),
    );
  }
}

class AuthStatusText extends StatelessWidget {
  const AuthStatusText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = context.watch<AuthProvider>();
    return Text(_provider.status, style: Theme.of(context).textTheme.headline3);
  }
}
