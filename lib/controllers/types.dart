import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/models/poke_lists.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon.dart';

import '../models/extensions.dart' as my_extensions;

class PokeTypes extends StatelessWidget {
  const PokeTypes({super.key, required this.typeList});
  final List<Types> typeList;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(context).size.shortestSide;

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;
    final bool landscapeModeActive = screenWidth > screenHeight;
    List<Widget> pokeTypes = [];
    for (var type in typeList) {
      var typeName = my_extensions.capitalize(type.type!.name!);
      Color typeColor = Color(typeColors[type.type!.name]!.toInt());
      pokeTypes.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: typeColor,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.elliptical(12, 12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              typeName,
              style: TextStyle(fontSize: useMobileLayout ? 15 : 18),
            ),
          ),
        ),
      ));
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: pokeTypes,
    );
  }
}
