import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intro_to_widgets/models/Extensions.dart';

/// gets all the pokemon from the url provided limited to 20 results per page
///
/// the [url] entered will determine the list of pokemon that are returned
///
Future<List<Map<String, dynamic>>> getPokemon(url) async {
  List<Map<String, dynamic>> fullList = [];
  var uri = Uri.parse(url);
  var request = await http.get(uri);
  var response = json.decode(request.body);
  var next = {"next": response["next"]};
  var prev = {
    "prev": response["previous"] ?? "https://pokeapi.co/api/v2/pokemon/"
  };
  fullList.add(next);
  fullList.add(prev);

  for (var pokemon in response['results']) {
    // getPokeByUrl(pokemon['url']);
    var uri2 = Uri.parse(pokemon['url']);
    var req2 = await http.get(uri2);
    var response2 = json.decode(req2.body);
    fullList.add(response2);
  }

  return fullList;
}

/// gets pokemons information about a pokemon
///
/// uses the [name] of a pokemon desired
///
Future<Map<String, dynamic>> findByName(String name) async {
  // print(name);
  String baseUrl = "https://pokeapi.co/api/v2/pokemon";
  String lowerName = name.toString().toLowerCase();
  String url = "$baseUrl/$lowerName";
  // print(url);
  var uri = Uri.parse(url);
  var req = await http.get(uri);

  var res = jsonDecode(req.body);

  return res;
}

/// gets info about a pokemon using that pokemons id
///
/// the [pokeid] is the id assigned to the pokemon by the API
///
Future<Map<String, dynamic>> getIndividualData(int pokeId) async {
  var uri = Uri.parse("https://pokeapi.co/api/v2/pokemon/$pokeId");
  var request = await http.get(uri);
  var response = json.decode(request.body);
  return response;
}

/// creates a list of all the pokemon names available in the API
///
 getAllPokemonsNames() async {
  List<String> allNames = [];
  int limit = 1154;
  String url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=$limit";
  var uri = Uri.parse(url);
  var request = await http.get(uri);
  var response = json.decode(request.body);
  // print(response["results"]);

  for (var pokemon in response["results"]) {
    allNames.add(capitalize(pokemon["name"]));
  }
  return allNames;
}

