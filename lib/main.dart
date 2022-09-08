import 'package:flutter/material.dart';

import 'Views/home.dart';

void main() => runApp(const MyApp());


/// myApp
/// 
/// page used as buffer for a possible db connnection to allow for async actions. 
///
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Pokedexer';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: HomeGrid()
    );
    
  }
}
