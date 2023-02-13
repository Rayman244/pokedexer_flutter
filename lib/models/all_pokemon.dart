import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedexer_flutter/models/extensions.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon.dart';

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
  String baseUrl = "https://pokeapi.co/api/v2/pokemon";
  String lowerName = name.toString().toLowerCase();
  String url = "$baseUrl/$lowerName";
  var res = await getFromUrl(url);

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

  print(Pokemon.fromJson(response));

  return response;
}

/// creates a list of all the pokemon names available in the API
///
getAllPokemonsNames() async {
  List<String> allNames = [];
  int limit = 1154;
  String url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=$limit";
  var response = await getFromUrl(url);

  for (var pokemon in response["results"]) {
    allNames.add(capitalize(pokemon["name"]));
  }
  return allNames;
}

/// gets all the pokedex enteries for a pokemon using there species [url]
Future<List> getPokedexEnteries(String url) async {
  try {
    var enEnteries = [];
    var editedEnteries = [];
    var versionGroups = [];
    var res = await getFromUrl(url);
    for (var entry in res['flavor_text_entries']) {
      if (entry["language"]["name"] == "en") {
        enEnteries.add(entry);
      }
    }
    for (var entry in enEnteries) {
      var editedEntry =
          entry["flavor_text"].replaceAll("\n", " ").replaceAll("\f", " ");

      editedEnteries.add(editedEntry);
    }
    List filteredEnteries = editedEnteries.toSet().toList();
    for (var fEntry in filteredEnteries) {
      var group = [];
      for (var entry in enEnteries) {
        var editedEntry =
            entry["flavor_text"].replaceAll("\n", " ").replaceAll("\f", " ");
        if (editedEntry == fEntry) {
          group.add(entry["version"]["name"]);
        }
      }
      versionGroups.add([group, fEntry]);
    }
    return versionGroups.toSet().toList();
    // return res['flavor_text_entries'];
  } catch (e) {
    debugPrint(e.toString());
    return [e];
  }
}

/// gets all the locations that the pokemon is available to be caught using there [url]
getPokemonLocation(url) async {
  var locationMap = [];
  try {
    var res = await getFromUrl(url);
    for (var location in res) {
      String ver;
      for (var version in location["version_details"]) {
        ver = version["version"]["name"];
        for (var detail in version["encounter_details"]) {
          var methodDetails = await getFromUrl(detail["method"]['url']);
          String conStr = "None";
          for (var condition in detail["condition_values"]) {
            var conditionDetails = await getFromUrl(condition["url"]);

            for (var conName in conditionDetails["names"]) {
              if (conName["language"]["name"] == "en") {
                conStr = conName["name"];
              }
            }
          }

          for (var recName in methodDetails["names"]) {
            if (recName["language"]["name"] == "en") {
              locationMap.add({
                "version": ver,
                "max_level": detail["max_level"],
                "min_level": detail["min_level"],
                "method": recName["name"],
                "chance": detail["chance"],
                "condition": conStr,
              });
            }
          }
        }
      }
    }

    return locationMap.toSet().toList();
  } catch (e) {
    debugPrint(e.toString());
  }
}

/// gets the [url] information from the db and returns it
getFromUrl(String url) async {
  try {
    Uri uri = Uri.parse(url);
    var req = await http.get(uri);
    var res = json.decode(req.body);
    return res;
  } catch (e) {
    debugPrint(e.toString());
  }
}

/// gets all the evolutions of a pokemon using their species url and

getEvolutions(String url) async {
  List<Map<String, dynamic>> evoList = [];

  var res = await getFromUrl(url);
  var evo = await getFromUrl(res["evolution_chain"]["url"]);
  String evo1Name = evo["chain"]["species"]["name"];

  var evo1 = await createEvolutionInfo(evo1Name);

  String t1Url =
      evo["chain"]["evolves_to"][0]["evolution_details"][0]["trigger"]["url"];

  var t1 = await createTrigger(
      t1Url, evo["chain"]["evolves_to"][0]["evolution_details"][0]);

  String evo2Name = evo["chain"]["evolves_to"][0]["species"]["name"];
  // print(evo["chain"]["evolves_to"]);
  for (var evolution in evo["chain"]["evolves_to"]) {
    print(evolution);
  }

  var evo2 = await createEvolutionInfo(evo2Name);
  evoList.add(evo1);
  evoList.add(t1);
  evoList.add(evo2);
  if (evo["chain"]["evolves_to"][0]["evolves_to"].length > 0) {
    var t2Url =
        evo["chain"]["evolves_to"][0]["evolution_details"][0]["trigger"]["url"];
    var t2 = await createTrigger(t2Url,
        evo["chain"]["evolves_to"][0]["evolves_to"][0]["evolution_details"][0]);

    String evo3Name =
        evo["chain"]["evolves_to"][0]["evolves_to"][0]["species"]["name"];

    var evo3 = await createEvolutionInfo(evo3Name);

    evoList.add(t2);
    evoList.add(evo3);
  }
  // print(evoList);
  return evoList;
}

Future<Map<String, dynamic>> createEvolutionInfo(String name) async {
  var evoInfo = await getFromUrl("https://pokeapi.co/api/v2/pokemon/$name");

  String evoImg =
      evoInfo["sprites"]["other"]["official-artwork"]["front_default"];
  int evo1Id = evoInfo["id"];
  Map<String, dynamic> evo = {
    "mapName": "evo",
    "id": evo1Id,
    "name": capitalize(name),
    "img": evoImg,
  };

  return evo;
}

Future<Map<String, dynamic>> createTrigger(String url, evo) async {
  var triggerdetails = await getFromUrl(url);
  var triggerlvl = "";
  // print(evo);
  evo.forEach((key, value) {
    if (value != null && value != "" && value != false && key != "trigger") {
      //
      if (key == "item" && value["name"] != null) {
        // print(value);
        // print("${eachCap(remSpecCharacters(key))} : ${eachCap(remSpecCharacters(value["name"])) }");
        triggerlvl =
            "${eachCap(remSpecCharacters(key))} : ${eachCap(remSpecCharacters(value["name"]))}";
      } else {
        triggerlvl = "${eachCap(remSpecCharacters(key))} : $value";
      }
    }
  });

  // var triggerlvl = evo["chain"]["evolves_to"][0]["evolution_details"][0]
  //         ["min_level"] ??
  //     evo["chain"]["evolves_to"][0]["evolution_details"][0]["item"] ??
  //     "Happiness: ${evo["chain"]["evolves_to"][0]["evolution_details"][0]["min_happiness"]}";

  String trigger = "";
  for (var trigName in triggerdetails["names"]) {
    if (trigName["language"]["name"] == "en") {
      trigger = trigName["name"];
    }
  }

  Map<String, dynamic> trig = {
    "mapName": "trigger",
    "lvl": triggerlvl,
    "trigger": trigger
  };
  return trig;
}
