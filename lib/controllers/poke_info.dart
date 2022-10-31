import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedexer_flutter/controllers/about/about_portion.dart';
import 'package:pokedexer_flutter/controllers/evolutions/evolutions_portion.dart';
import 'package:pokedexer_flutter/controllers/moves/moves_portion.dart';
import 'package:pokedexer_flutter/controllers/stats/stats_portion.dart';
import '../models/extensions.dart';
import '../controllers/my_widgets.dart';
import '../models/all_pokemon.dart';

///  list of all the pokemon info [pokeinfo] and gets it ready to be displayed
Widget infoPortion(
    Pokemon pokeinfo, BuildContext context, TabController tabController) {
log(pokeinfo.stats!.toString());
  int pokeId = pokeinfo.id!;
  String pokeName = capitalize(pokeinfo.name!);
  String pokeImg = pokeinfo.sprites!.oAFrontDefault!;
  int baseExp = pokeinfo.baseExperience!;
  int pokeHeight = pokeinfo.height!;
  int weight = pokeinfo.weight!;
  // var types = pokeinfo.data["types"];

  var abilities = pokeinfo.abilities;

  String speciesUrl = pokeinfo.species!.url!;

  var species = getFromUrl(speciesUrl);
  var pdEnteries = getPokedexEnteries(speciesUrl);
  var locations = getPokemonLocation(pokeinfo.locationAreaEncounters!);
  // var evolutions = getEvolutions(speciesUrl);
  // List moves = pokeinfo.data["moves"];

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
      getTypes(pokeinfo.types!),
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
            // Container(),
            aboutPortion(pokeHeight, weight, species, abilities, pdEnteries),
            statsPortion(pokeinfo.stats, baseExp, locations),
            // Container(),
            Container(),
            Container(),

            // evolutionsPortion(evolutions),
            // const Text("different evolutions"),
            // movesPortion(moves)
          ],
        ),
      )),
    ],
  );
}
