import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/models/extensions.dart';
import 'package:pokedexer_flutter/models/pokemon/egg-group.dart';

class SpeciesPortion extends StatelessWidget {
  const SpeciesPortion({super.key, this.eggGroup});
  final List<EggGroup>? eggGroup;

  @override
  Widget build(BuildContext context) {
    List<Widget> speciesWidgets = [];
    for (EggGroup group in eggGroup ?? []) {
      speciesWidgets.add(
        Text(capitalize(group.name!)),
      );
    }
    if (speciesWidgets.length > 1) {
      speciesWidgets.insert(
          1,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text("/"),
          ));
    }
    return Row(
      children: speciesWidgets,
    );
  }
}
