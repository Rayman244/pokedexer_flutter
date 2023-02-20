import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/Views/poke_page/utils/about/utils/pokedex_enteries.dart';

import 'package:pokedexer_flutter/Views/poke_page/utils/about/utils/species_portion.dart';
import 'package:pokedexer_flutter/models/extensions.dart';
// ignore: unused_import
import 'package:pokedexer_flutter/models/pokemon/ability.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon.dart';

class About extends StatelessWidget {
  const About({super.key, this.pokemon});
  final Pokemon? pokemon;
  @override
  Widget build(BuildContext context) {
    const List<String> infoTitlesList = [
      "Height",
      "Weight",
      "Species",
      "Abilities",
    ];
    List<Widget> infoTitleWidgets = [];
    for (String title in infoTitlesList) {
      infoTitleWidgets.add(Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ));
    }
    Widget infoTitles = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: infoTitleWidgets,
    );
    // print(pokemon?.abilities);
    List<String> abilityList = [];
    List<Widget> abilityWidgets = [];

    if (pokemon?.abilities != null) {
      for (Abilities ability in pokemon?.abilities ?? []) {
        abilityList.add(ability.ability!.name!);
      }
      for (String ability in abilityList) {
        abilityWidgets.add(Text(capitalize(ability)));
      }
      if (abilityWidgets.length > 1) {
        abilityWidgets.insert(
            1,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text("/"),
            ));
      }
    }
    Widget abilityRow = Row(
      children: abilityWidgets,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10),
                child: infoTitles,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${dectoft(pokemon?.height ?? 0)} ft"),
                    Text("${heToLb(pokemon?.weight ?? 0)} lbs"),
                    SpeciesPortion(eggGroup: pokemon?.eggGroup),
                    abilityRow
                    // Row(
                    //   children: speciesPortion(eggGroup),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Pokedex Enteries",
                      style: TextStyle(
                          // fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                PokedexEnteries(
                  flavorTextEnteries: pokemon?.species?.flavorTextEntries,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
