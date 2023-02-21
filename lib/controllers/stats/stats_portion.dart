import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/models/extensions.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon.dart';

import 'stats_widgets.dart';

class StatsPortion extends StatelessWidget {
  const StatsPortion({super.key, this.stats, this.baseExp});
  final List<Stats>? stats;
  final int? baseExp;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> statsNames = [];

    /// handles the stats of a pokemon taking the [statsList] of all the stats a pokemon has. As well as the [baseExp] of a pokemon.
    List<Widget> statsNum(List<Stats>? statsList, int? baseExp) {
      List<Widget> stats = [];

      if (statsList != null) {
        for (Stats stat in statsList) {
          stats.add(Text(stat.baseStat.toString()));
          statsNames.add(Text(eachCap(stat.stat!.name!, joinType: "-")));
        }
        stats.add(Text(baseExp.toString()));
        statsNames.add(const Text("Base-Experience"));
      }

      return stats;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: statsNames),
                SizedBox(
                  width: screenWidth * .2,
                ),
                Column(
                  children: statsNum(stats, baseExp),
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Locations",
                      style: TextStyle(
                          // fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 70,
                        child: Text('Version:'),
                      ),
                      SizedBox(
                        width: 35,
                        child: Text("Level"),
                      ),
                      SizedBox(width: 40, child: Text("Odds")),
                      SizedBox(child: Text("Condition")),
                      Expanded(child: Center(child: Text("Method"))),
                    ],
                  ),
                ),
                // FutureBuilder(
                //   future: locations,
                //   builder: (BuildContext context, snapshot) {
                //     List<Widget> children = [];
                //     if (snapshot.hasData) {
                //       children = locationsPortion(snapshot);
                //     } else if (snapshot.hasError) {
                //       children = const [Text("Error getting info")];
                //       debugPrint("Error getting data");
                //     } else {
                //       children = [
                //         const Center(
                //           child: SizedBox(
                //             width: 60,
                //             height: 60,
                //             child: CircularProgressIndicator(),
                //           ),
                //         )
                //       ];
                //     }
                //     return Column(
                //       children: children,
                //     );
                //   },
                // ),
              ],
            ),
            // Future builder with location enteries
          ],
        ),
      ),
    );
  }
}
