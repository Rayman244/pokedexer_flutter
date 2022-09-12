import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/controllers/about/about_portion.dart';
import 'package:pokedexer_flutter/controllers/evolutions/evolutions_portion.dart';
import 'package:pokedexer_flutter/controllers/moves/moves_portion.dart';
import 'package:pokedexer_flutter/controllers/stats/stats_portion.dart';
import '../models/extensions.dart';
import '../controllers/my_widgets.dart';
import '../models/all_pokemon.dart';

///  list of all the pokemon info [pokeinfo] and gets it ready to be displayed
Widget infoPortion(
    pokeinfo, BuildContext context, TabController tabController) {
  int pokeId = pokeinfo.data["id"];
  String pokeName = capitalize(pokeinfo.data!['name']);
  String pokeImg =
      pokeinfo.data["sprites"]["other"]["official-artwork"]["front_default"];
  int baseExp = pokeinfo.data["base_experience"];
  int pokeHeight = pokeinfo.data["height"];
  int weight = pokeinfo.data["weight"];
  var types = pokeinfo.data["types"];
  var abilities = pokeinfo.data["abilities"];
  String speciesUrl = pokeinfo.data["species"]["url"];

  var species = getFromUrl(speciesUrl);
  var pdEnteries = getPokedexEnteries(speciesUrl);
  var locations = getPokemonLocation(pokeinfo.data["location_area_encounters"]);
  var evolutions = getEvolutions(speciesUrl);
  List moves = pokeinfo.data["moves"];

  // getPokedexEnteries(pokeinfo.data["species"]["url"]);
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              pokeName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("#$pokeId"),
          ),
        ],
      ),
      getTypes(types),
      // PokeInfo.getPokemonData();

      Center(
        child: Image(
          height: 200,
          image: NetworkImage(pokeImg),
        ),
      ),
      SizedBox(
        height: 40,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
          child: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            tabs: const [
              Tab(text: "About"),
              Tab(text: "Stats"),
              Tab(text: "Evolution"),
              Tab(text: "Moves"),
            ],
          ),
        ),
      ),
      Expanded(
          child: ColoredBox(
        color: Colors.white,
        child: TabBarView(
          controller: tabController,
          children: [
            aboutPortion(pokeHeight, weight, species, abilities, pdEnteries),
            statsPortion(pokeinfo.data["stats"], baseExp, locations),
            evolutionsPortion(evolutions),
            // const Text("different evolutions"),
            movesPortion(moves)
          ],
        ),
      )),
    ],
  );
}
