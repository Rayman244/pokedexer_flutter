import 'package:flutter/material.dart';

import '../../models/extensions.dart';

/// handles the stats of a pokemon taking the [statsList] of all the stats a pokemon has. As well as the [baseExp] of a pokemon.
List<Widget> statsNum(List statsList, int baseExp) {
  List<Widget> stats = [];
  for (Map<String, dynamic> stat in statsList) {
    stats.add(Text(stat["base_stat"].toString()));
  }

  stats.add(Text(baseExp.toString()));
  return stats;
}

locationsPortion(allLocations) {
  List<Widget> varLocationEnteries = [];

  for (var location in allLocations.data) {
    // print(location);
    String minMaxLvl = "${location["min_level"]} - ${location["max_level"]} ";
    if (location["min_level"] == location["max_level"]) {
      minMaxLvl = location["max_level"].toString();
    }

    varLocationEnteries.add(Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Center(child: Text(capitalize(location["version"]))),
          ),
          SizedBox(width: 35, child: Center(child: Text(minMaxLvl.toString()))),
          SizedBox(
              width: 40,
              child: Center(child: Text(location["chance"].toString()))),
          SizedBox(
              width: 75, child: Center(child: Text(location["condition"]))),
          Expanded(
              // width: 100,
              child: Center(child: Text(location["method"]))),
        ],
      ),
    ));
  }
  if (allLocations.data.length < 1) {
    return  [
       Column(
         children: const [
           Text("Not Found In Wild"),
         ],
       )
    ];
  }
  return varLocationEnteries;
}
