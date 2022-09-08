// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intro_to_widgets/models/extensions.dart';








class SearchResults extends StatelessWidget {
  SearchResults({Key? key, required this.snapshot}) : super(key: key);
  AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    String pokeImg =
        snapshot.data["sprites"]["other"]["official-artwork"]["front_default"];

    int height =  snapshot.data["height"];
    int weight = snapshot.data["weight"];

    List<Widget> stats = [];
    snapshot.data["stats"].forEach((stat) {
      stats.add(
          Text("${capitalize(stat['stat']['name'])}: ${stat["base_stat"]}"));
    });

    // int hp = snapshot.data["stats"][0]["base_stat"];
    // int attack = snapshot.data["stats"][1]["base_stat"];
    // int def = snapshot.data["stats"][2]["base_stat"];
    // int specAttack = snapshot.data["stats"][3]["base_stat"];

    return 
    Column(
      children: [
        Row(
          children: [
            Image(
              height: 200,
              image: NetworkImage(pokeImg),
            ),
            const Spacer(),
            Column(
              children: stats,
            ),
              const Spacer(),
          ],
        ),
        Row(
          children: [
            Center(
              child: Column(
                children: [
                  Text("Height: ${dectoft(height)} ft"),
                  Text("Weight: ${heToLb(weight)} lb"),
                ],
              ),
            )
          ],
        ),

      ],
    );
  }
}
