import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intro_to_widgets/models/Extensions.dart';

Future<List<Map<String, dynamic>>> getPokemon(url) async {
  List<Map<String, dynamic>> fullList = [];
  var uri = Uri.parse(url);
  var request = await http.get(uri);
  var response = json.decode(request.body);
  var next = {"next": response["next"]};
  var prev = {
    "prev": response["previous"] ?? "https://pokeapi.co/api/v2/pokemon/"
  };
  // if (response["previous"] != Null) {
  //   print(response["previous"]);
  // }
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

getByUrl(String url) async {
  var uri = Uri.parse(url);
  var req = await http.get(uri);
  var res = jsonDecode(req.body);
  print(res);
}

findByName(String name) async {
  print(name);
  String baseUrl = "https://pokeapi.co/api/v2/pokemon";
  String lowerName = name.toString().toLowerCase();
  String url = "$baseUrl/$lowerName";
  print(url);
  var uri = Uri.parse(url);
  var req = await http.get(uri);

  var res = jsonDecode(req.body);
  return res;
}

Future<Map<String, dynamic>> getIndividualData(pokeId) async {
  var uri = Uri.parse("https://pokeapi.co/api/v2/pokemon/$pokeId");
  var request = await http.get(uri);
  var response = json.decode(request.body);
  return response;
}

getAllPokemonsNames() async {
  List<String> allNames = [];
  String url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1154";
  var uri = Uri.parse(url);
  var request = await http.get(uri);
  var response = json.decode(request.body);
  // print(response["results"]);

  for (var pokemon in response["results"]) {
    allNames.add(capitalize(pokemon["name"]));
  }
  return allNames;
}
