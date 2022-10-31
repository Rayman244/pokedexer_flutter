import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/models/extensions.dart';

/// gets the pokedex [enteries] loops through to only get the ones in english. filrers them to remove any unwanted characters, then creates a text widget for each entry.
List<Widget> pdEnteriesPortion(AsyncSnapshot enteries) {
  List<Widget> pdEnteries = [];

  enteries.data.forEach((entry) {
    List<Widget> versions = [];
    for (var version in entry[0]) {
      versions.add(Text(capitalize(version)));
    }
    pdEnteries.add(Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: SizedBox(
              width: 110,
              child: Column(
                children: versions,
              ),
            ),
          ),
          Expanded(child: Text(entry[1])),
        ],
      ),
    ));
  });

  return pdEnteries;
}

/// handles displaying the abilities portion of the about tab. takes a list [abil] adds the wanted text to an array and adds it to the array to be returned
Widget abilitiesPortion(List abil) {
  List<Widget> abilities = [];

  for (var ability in abil) {
    abilities.add(
      Row(
        children: [
          Text(capitalize(ability.ability.name)),
        ],
      ),
    );
  }
  // if (abilities.length > 1) {
  //   abilities.insert(
  //       1,
  //       const Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 2),
  //         child: Text(","),
  //       ));
  // }

  return Column(
    children: abilities,
  );
}

/// returns a list of text widgets. using the [speciesinfo] to get the egg group an format it in cast there are multiple groupd
List<Widget> speciesPortion(AsyncSnapshot speciesInfo) {
  List<Widget> speciesWidgets = [];
  // print(speciesInfo.data["egg_groups"]);

  for (Map<String, dynamic> group in speciesInfo.data["egg_groups"]) {
    speciesWidgets.add(
      Text(capitalize(group["name"])),
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

  // speciesWdgets.add(value)

  return speciesWidgets;
}
