import 'package:flutter/material.dart';
import 'package:intro_to_widgets/Views/home_card.dart';

Widget allPokemon(pokedata, BuildContext ctx, Function refresh) {
  // print(pokedata.data);
  List pokeData = pokedata.data;
  var next = pokeData.removeAt(0);
  var prev = pokeData.removeAt(0);

  print(next['next']);
  print("////////////////////////");
  print(prev['prev']);

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
            ))
          ],
        )
      : const Center(child: CircularProgressIndicator());
}

// class AllPokemon extends StatefulWidget {
//   const AllPokemon({Key? key, required startData}) : super(key: key);
//   // var startData;
//   @override
//   State<AllPokemon> createState() => _AllPokemonState();
// }

// class _AllPokemonState extends State<AllPokemon> {
//   @override
//   Widget build(BuildContext context) {
//     print(widget.startData);
//     return Text("hello");
//   }
// }
