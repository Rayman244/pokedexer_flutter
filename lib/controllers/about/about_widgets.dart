import 'package:flutter/material.dart';
import '../../models/extensions.dart';

/// gets the pokedex [enteries] loops through to only get the ones in english. filrers them to remove any unwanted characters, then creates a text widget for each entry.
List<Widget> pdEnteriesPortion(AsyncSnapshot enteries) {
  List<Widget> pdEnteries = [];
  var enEntries = [];
  var editedEntries2 = [];

  enteries.data.forEach((entry) {
    // print(entry["language"]['name']);
    if (entry["language"]['name'] == "en") {
      enEntries.add(entry);
    }
  });

  for (var entry in enEntries) {
    editedEntries2
        .add(entry["flavor_text"].replaceAll("\n", " ").replaceAll("\f", " "));
    // print();
  }

  for (var enEntry in editedEntries2.toSet().toList()) {
    pdEnteries.add(Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(enEntry),
    ));
  }
  // print(editedEntries2);
  return pdEnteries;
}

/// handles displaying the abilities portion of the about tab. takes a list [abil] adds the wanted text to an array and adds it to the array to be returned
List<Widget> abilitiesPortion(List abil) {
  List<Widget> abilities = [];

  for (var ability in abil) {
    abilities.add(
      Text(capitalize(ability["ability"]["name"])),
    );
  }
  if (abilities.length > 1) {
    abilities.insert(
        1,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Text(","),
        ));
  }

  return abilities;
}

/// handles the stats of a pokemon taking the [statsList] of all the stats a pokemon has. As well as the [baseExp] of a pokemon.
List<Widget> statsPortion(List statsList, int baseExp) {
  List<Widget> stats = [];
  for (Map<String, dynamic> stat in statsList) {
    stats
        .add(Text("${capitalize(stat['stat']['name'])}: ${stat["base_stat"]}"));
  }

  stats.add(Text("Base Exp: ${baseExp.toString()}"));
  return stats;
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
