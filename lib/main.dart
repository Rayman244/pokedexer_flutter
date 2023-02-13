import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/Views/home2.dart';

import 'Views/home.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

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
    return MaterialApp(
      title: _title,
      navigatorKey: navKey,
      routes: {
        "/home": (context) => const HomeGrid(),
        "/home2": (context) => const Home2(),
      },
      initialRoute: "/home2",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Colors.red,
            titleTextStyle: TextStyle(
                fontFamily: "PokemonSolid",
                fontStyle: FontStyle.italic,
                fontSize: 32)),
        primaryColor: Colors.red,
      ),
    );
  }
}
