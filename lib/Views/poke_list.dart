import 'package:flutter/material.dart';
import 'package:intro_to_widgets/Views/home_card.dart';

/// displays a list of all the pokemon in a list 

Widget allPokemon(pokedata, BuildContext ctx, Function refresh) {
  List pokeData = pokedata.data;
  var next = pokeData.removeAt(0);
  var prev = pokeData.removeAt(0);

  return next['next'] != null
      ? Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    refresh(next["next"]);
                  },
                  child: const Text("Next"),
                ),
                ElevatedButton(
                  onPressed: () {
                    refresh(prev["prev"]);
                  },
                  child: const Text("Prev"),
                ),
              ],
            ),
            Expanded(
                child: ListView(
              children: homeCard(pokeData, ctx),
            ),
            )
          ],
        )
      : const Center(child: CircularProgressIndicator());
}

