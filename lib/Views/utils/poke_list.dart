import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/Views/home_card.dart';
import 'package:pokedexer_flutter/constants.dart';
import 'package:pokedexer_flutter/models/all_pokemon.dart'as poke_info;

/// displays a list of all the pokemon in a list

class AllPokemon extends StatefulWidget {
  AllPokemon({super.key, required this.initialPokedata});
  List<Map<String, dynamic>> initialPokedata;

  @override
  State<AllPokemon> createState() => _AllPokemonState();
}

class _AllPokemonState extends State<AllPokemon> {
  Future<List<Map<String, dynamic>>> pokeList =poke_info.getPokemon(baseUrl);
  late List<Map<String, dynamic>> pokeData;
  @override
  void initState() {
    super.initState();
    pokeData = widget.initialPokedata;
  }
   bool isButtonActive = true;

    toggleButton(buttonState) {
      if (buttonState == true) {
        setState(() {
          isButtonActive = false;
        });
      } else {
        setState(() {
          isButtonActive = true;
        });
      }
    }

    refresh(next) {
      setState(() {
        pokeList = poke_info.getPokemon(next);
        toggleButton(isButtonActive);
      });
    }

  @override
  Widget build(BuildContext context) {
    var next = pokeData.removeAt(0);
  var prev = pokeData.removeAt(0);
  return Column(
    children: [
      ColoredBox(
        color: Colors.black,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                        refresh(prev["prev"]);
                        // loading snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Loading Please Wait')),
                        );
                      }
                    : null,
                child: const Text("Prev"),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  refresh(next["next"]);
                  // loading snackbar

                  ScaffoldMessenger.of(context).showSnackBar(
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
          children: homeCard(pokeData, context),
        ),
      )
    ],
  );
  }
}

Widget allPokemon(List<Map<String, dynamic>>? pokedata, BuildContext ctx,
    Function refresh, bool buttonActive) {
  List<Map<String, dynamic>>? pokeData = pokedata;

  var next = pokeData?.removeAt(0);
  var prev = pokeData?.removeAt(0);
  return Column(
    children: [
      ColoredBox(
        color: Colors.black,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: buttonActive
                    ? () {
                        refresh(prev!["prev"]);
                        // loading snackbar
                        ScaffoldMessenger.of(ctx).showSnackBar(
                          const SnackBar(content: Text('Loading Please Wait')),
                        );
                      }
                    : null,
                child: const Text("Prev"),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  refresh(next!["next"]);
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
          children: homeCard(pokeData!, ctx),
        ),
      )
    ],
  );
}
