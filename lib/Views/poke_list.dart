import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedexer_flutter/Views/home_card.dart';

/// displays a list of all the pokemon in a list

Widget allPokemon(List<Pokemon?> pokeData, BuildContext ctx, Function refresh,bool buttonActive) {
 
  // List<Map<String, dynamic>>? pokeData = pokedata.data;
  

  // var next = pokeData?.removeAt(0);
  // var prev = pokeData?.removeAt(0);
  return Column(
    children: [
      ColoredBox(
        color: Colors.black,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: buttonActive ? () {
                        // refresh(prev!["prev"]);
                        // loading snackbar
                        ScaffoldMessenger.of(ctx).showSnackBar(
                          const SnackBar(content: Text('Loading Please Wait')),
                        );
                      }:null
                    ,
                child: const Text("Prev"),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  // refresh(next!["next"]);
                  // loading snackbar

                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text('Loading Please Wait')),
                  );
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          children: homeCard(pokeData, ctx),
        ),
      )
    ],
  );
}
