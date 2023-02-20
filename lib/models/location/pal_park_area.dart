import 'package:pokedexer_flutter/models/utils/common.dart';

class PalParkArea {
  List<PalParkAreaName>? names;
  List<PalParkAreaPokemonEncounter>? pokemonEncounters;
  String? name;
  int? id;

  PalParkArea({this.names, this.pokemonEncounters, this.name, this.id});

  PalParkArea.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <PalParkAreaName>[];
      for (var v in (json['names'] as List)) {
        names!.add(PalParkAreaName.fromJson(v));
      }
    }
    if (json['pokemon_encounters'] != null) {
      pokemonEncounters = <PalParkAreaPokemonEncounter>[];
      for (var v in (json['pokemon_encounters'] as List)) {
        pokemonEncounters!.add(PalParkAreaPokemonEncounter.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (pokemonEncounters != null) {
      data['pokemon_encounters'] =
          pokemonEncounters!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'PalParkArea{names: $names, pokemonEncounters: $pokemonEncounters, name: $name, id: $id}';
  }
}

class PalParkAreaName {
  String? name;
  NamedAPIResource? language;

  PalParkAreaName({this.name, this.language});

  PalParkAreaName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PalParkAreaName{name: $name, language: $language}';
  }
}

class PalParkAreaPokemonEncounter {
  int? baseScore;
  int? rate;
  NamedAPIResource? pokemonSpecies;

  PalParkAreaPokemonEncounter({this.baseScore, this.rate, this.pokemonSpecies});

  PalParkAreaPokemonEncounter.fromJson(Map<String, dynamic> json) {
    baseScore = json['base_score'];
    rate = json['rate'];
    pokemonSpecies = json['pokemon_species'] != null
        ? NamedAPIResource.fromJson(json['pokemon_species'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_score'] = baseScore;
    data['rate'] = rate;
    if (pokemonSpecies != null) {
      data['pokemon_species'] = pokemonSpecies!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PalParkAreaPokemonEncounter{baseScore: $baseScore, rate: $rate, pokemonSpecies: $pokemonSpecies}';
  }
}
