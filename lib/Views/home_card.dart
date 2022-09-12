import 'package:flutter/material.dart';
import 'package:pokedexer_flutter/controllers/my_widgets.dart';
import 'package:pokedexer_flutter/models/poke_lists.dart';
import '../models/extensions.dart' as my_extensions;

import 'poke_page.dart';

/// loops through each pokemon and creates a list of cards for each with some info about them
///
/// [pokelist] is the list of the pokemon in groups of 20 with there info.
///
List<Widget> homeCard(List pokeList, BuildContext ctx) {
  List<Widget> indivInfo = [];
  for (var pokemon in pokeList) {
    var pokeId = pokemon["id"];
    var pokeName = my_extensions.capitalize(pokemon["name"]);
    String pokeImg =
        pokemon["sprites"]["other"]["official-artwork"]["front_default"];
    var pokeTypes = pokemon["types"];
    String pokeMainType = pokeTypes[0]["type"]['name'];
    String? pokeSecType = pokeMainType;
    try {
      pokeSecType = pokeTypes?[1]["type"]['name'];
    } catch (e) {
      // debugPrint(e.toString());

    }

    // var secCol = pokeSecType ?? pokeMainType;

    Color primaryColor = Color(typeColors[pokeMainType]!.toInt());
    Color secondryColor = Color(typeColors[pokeSecType]!.toInt());

    indivInfo.add(
      Card(
        color: Color(typeColors[pokeMainType]!.toInt()),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [primaryColor, secondryColor])),
          child: InkWell(
            splashColor: Colors.red,
            // onTap: () =>print( poke_info.getIndividualData(poke_url)),
            onTap: () =>
                // Navigator.push(ctx, PokePage());
                Navigator.of(ctx).push(MaterialPageRoute(
                    builder: (_) => PokePage(
                          pokeId: pokeId,
                          name: pokeName,
                          mainType: pokeMainType,
                          secType: pokeSecType,
                        ))),
            child: Column(
              children: [
                Image(
                  height: 135,
                  image: NetworkImage(pokeImg),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(12.0, 5, 0, 0),
                          //   child: Text("id: $pokeId"),
                          // ),
                           Text(
                              pokeName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                          
                          ),
                        ],
                      ),
                      Center(
                        child: getTypes(pokeTypes),
                          // PokeInfo.getPokemonData();
                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  return indivInfo;
}
