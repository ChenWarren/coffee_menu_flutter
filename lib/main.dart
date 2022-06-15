import 'package:coffee_menu/screens/home.dart';
import 'package:coffee_menu/screens/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Menu',
      theme: ThemeData(
        primaryColor: Colors.brown,
        backgroundColor: Colors.orange[100],
        splashColor: Colors.black54,
        focusColor: Colors.lightGreen[300],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Landing(),
        '/home': (context) => const Home(),
      },
    );
  }
}
