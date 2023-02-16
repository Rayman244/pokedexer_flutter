import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/models/poke_lists.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon.dart';

import '../models/extensions.dart' as my_extensions;

class PokeTypes extends StatelessWidget {
  const PokeTypes({super.key, required this.typeList});
  final List<Types> typeList;

  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(
                  // backgroundColor: typeColor,
                  ),
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
