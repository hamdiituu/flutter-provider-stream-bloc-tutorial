import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bloc_tutorial/pages/auth_provider_example_page.dart';
import 'package:provider_bloc_tutorial/pages/auth_provider_protected_example_page.dart';
import 'package:provider_bloc_tutorial/pages/counter_provider_easy_example_page.dart';
import 'package:provider_bloc_tutorial/pages/counter_provider_example_page.dart';
import 'package:provider_bloc_tutorial/pages/main_page.dart';
import 'package:provider_bloc_tutorial/pages/money_provider_example_page.dart';
import 'package:provider_bloc_tutorial/providers/auth_provider.dart';
import 'package:provider_bloc_tutorial/providers/counter_provider.dart';
import 'package:provider_bloc_tutorial/providers/money_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blueGrey,
              scaffoldBackgroundColor: const Color.fromRGBO(40, 40, 40, 1)),
          initialRoute: '/main',
          routes: {
            '/main': (context) => MainPage(),
            '/counter_provider_example': (context) =>
                ChangeNotifierProvider<CounterProvider>(
                  create: (_) => CounterProvider(),
                  child: const CounterProviderExamplePage(),
                ),
            '/counter_provider_easy_example': (context) =>
                ChangeNotifierProvider<CounterProvider>(
                  create: (_) => CounterProvider(),
                  child: const CounterProviderEasyExamplePage(),
                ),
            '/money_provider_example': (context) =>
                ChangeNotifierProvider<MoneyProvider>(
                  create: (_) => MoneyProvider(),
                  child: const MoneyProviderExamplePage(),
                ),
            '/auth_provider_example': (context) =>
                const AuthProviderExamplePage(),
            '/auth_provider_protected_example': (context) {
              if (context.watch<AuthProvider>().loginStatus ==
                  LoginTypes.Success) {
                return AuthProviderProtectedExamplePage();
              } else {
                print("yönlendirildi!");
                return AuthProviderExamplePage();
              }
            }
          },
        ),
      );
    });
  }
}
