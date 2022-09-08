import 'package:flutter/material.dart';
import 'package:intro_to_widgets/controllers/about/about_portion.dart';

// import 'package:intro_to_widgets/models/poke_lists.dart';

import '../models/extensions.dart';
import '../controllers/my_widgets.dart';
import '../models/all_pokemon.dart';

import 'about/about_widgets.dart';

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

  var species = getSpecies(pokeinfo.data["species"]["url"]);
  var pdEnteries = getPokedexEnteries(pokeinfo.data["species"]["url"]);

  getPokedexEnteries(pokeinfo.data["species"]["url"]);
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
      Row(
        children: getTypes(types),
        // PokeInfo.getPokemonData();
      ),
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
            Column(
              children: statsPortion(pokeinfo.data["stats"], baseExp),
            ),
            const Text("different evolutions"),
            const Text("All Moves"),
          ],
        ),
      )),
    ],
  );
}
