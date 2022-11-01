import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/model/pokemon/stat.dart';
import 'package:pokedexer_flutter/models/extensions.dart';

/// handles the stats of a pokemon taking the [statsList] of all the stats a pokemon has. As well as the [baseExp] of a pokemon.
List<Widget> statsNum(List<Stats>? statsList, int baseExp) {
  List<Widget> stats = [];
  for (Stats stat in statsList!) {
    // print(stat.baseStat);
    stats.add(Text(stat.baseStat.toString()));
  }

  stats.add(Text(baseExp.toString()));
  return stats;
}

locationsPortion(allLocations, context) {
  List<Widget> varLocationEnteries = [];
  // print(allLocations);
  // varLocationEnteries.add(ExpansionTile(title: title))
  Map filteredEnteries = {};
  for (var location in allLocations) {
    for (var version in location["versions"]) {
      if (filteredEnteries[version] == null) {
        filteredEnteries[version] = {
          "chance": location["chance"],
          location["location_name"]: location["encounters"]
        };
      }
    }

    // print(location);

    // varLocationEnteries.add(ExpansionTile(title: Text(eachCap(versions))));

    //   String locName =
    //       eachCap(location["location_area"]["name"].replaceAll("-", " "));
    //   varLocationEnteries.add(ListTile(
    //     title: Text(locName),
    //     onTap: (() {
    //       showDialog(
    //           context: context,
    //           builder: (BuildContext context) {
    //             return AlertDialog(
    //               title: Text(locName),
    //               content: ListView(),
    //             );
    //           });
    //     }),
    //   ));
  }

  filteredEnteries.forEach((key, value) {
    // print(value);
    late String name;
    late int chance;
    late Map encounter;
    value.forEach((key, value) {
      if (key != "chance") {
        name = eachCap(key.replaceAll("-", " "));
        encounter = value;
      } else {
        chance = value;
      }
    });
    print(encounter);
    varLocationEnteries.add(ExpansionTile(
      title: Text(eachCap(key)),
      children: [
        Row(
          children: [Text(name), const Spacer(), Text("Chance: $chance")],
        )
      ],
    ));
  });

  // for (var location in allLocations.data) {
  //   // print(location);
  //   String minMaxLvl = "${location["min_level"]} - ${location["max_level"]} ";
  //   if (location["min_level"] == location["max_level"]) {
  //     minMaxLvl = location["max_level"].toString();
  //   }

  //   varLocationEnteries.add(Padding(
  //     padding: const EdgeInsets.only(bottom: 10),
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 70,
  //           child: Center(child: Text(capitalize(location["version"]))),
  //         ),
  //         SizedBox(width: 35, child: Center(child: Text(minMaxLvl.toString()))),
  //         SizedBox(
  //             width: 40,
  //             child: Center(child: Text(location["chance"].toString()))),
  //         SizedBox(
  //             width: 75, child: Center(child: Text(location["condition"]))),
  //         Expanded(
  //             // width: 100,
  //             child: Center(child: Text(location["method"]))),
  //       ],
  //     ),
  //   ));
  // }
  if (allLocations.length < 1) {
    return [
      Column(
        children: const [
          Text("Not Found In Wild"),
        ],
      )
    ];
  }
  return varLocationEnteries;
}
