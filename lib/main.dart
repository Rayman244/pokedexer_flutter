import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/Views/home.dart';
import 'package:pokedexer_flutter/constants.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

void main() => runApp(const MyApp());

/// myApp
///
/// page used as buffer for a possible db connnection to allow for async actions.
///
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Pokédexer';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      routes: {
        "/home": (context) => const Home(
              title: _title,
            ),
      },
      initialRoute: "/home",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: PokeColors.red,
          titleTextStyle: const TextStyle(
            // fontFamily: "PokemonSolid",
            fontSize: 32,
            // color: PokeColors.darkYellow,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: PokeColors.blue,
            backgroundColor: PokeColors.yellow,
            shadowColor: PokeColors.blue,
            side: BorderSide(color: PokeColors.blue),
            textStyle: TextStyle(
              color: PokeColors.blue,
              fontSize: 20,
              fontFamily: "PokemonSolid",
            ),
          ),
        ),
      ),
    );
  }
}
