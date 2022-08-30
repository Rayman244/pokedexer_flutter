// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'Views/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Pokedexer';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: _title,
      home: Scaffold(
        appBar:  AppBar(backgroundColor: Colors.red, title: const Text("Pokedex")),
        body: HomeGrid(),
      ),
    );
  }
}
