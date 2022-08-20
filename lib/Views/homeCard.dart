import 'package:flutter/material.dart';
import '../models/Extensions.dart' as my_extensions;
import "./pokePage.dart";

List<Widget> homeCard(pokeList, ctx) {
  List<Widget> indivInfo = [];
  for (var pokemon in pokeList.data) {
    var pokeId = pokemon["id"];
    var pokeName = my_extensions.capitalize(pokemon["name"]);
    var pokeImg =
        pokemon["sprites"]["other"]["official-artwork"]["front_default"];
    var pokeTypes = pokemon["types"];

    indivInfo.add(Center(
      child: Card(
        child: InkWell(
            splashColor: Colors.red,
            // onTap: () =>print( poke_info.getIndividualData(poke_url)),
            onTap: () =>
                // Navigator.push(ctx, PokePage());
                Navigator.of(ctx).push(MaterialPageRoute(
                    builder: (_) => PokePage(pokeId: pokeId, name: pokeName))),
            child: Column(
              children: [
                Image(
                  height: 135,
                  image: NetworkImage("$pokeImg"),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 5, 0, 0),
                            child: Text("id: $pokeId"),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 5, 0, 0),
                            child: Text(
                              pokeName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: getTypes(pokeTypes),
                        // PokeInfo.getPokemonData();
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    ));
  }
  return indivInfo;
}

List<Widget> getTypes(typeList) {
  List<Widget> pokeTypes = [];
  for (var type in typeList) {
    var typeName = my_extensions.capitalize(type["type"]['name']);
    pokeTypes.add(Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(typeName),
    ));
  }
  return pokeTypes;
}
