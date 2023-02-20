import 'package:pokedexer_flutter/models/utils/common.dart';

class PokemonHabitat {
  int? id;
  String? name;
  List<Names>? names;
  List<NamedAPIResource>? pokemonSpecies;

  PokemonHabitat({this.id, this.name, this.names, this.pokemonSpecies});

  PokemonHabitat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(Names.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = <NamedAPIResource>[];
      json['pokemon_species'].forEach((v) {
        pokemonSpecies!.add(NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (pokemonSpecies != null) {
      data['pokemon_species'] =
          pokemonSpecies!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokemonHabitat{id: $id, name: $name, names: $names, pokemonSpecies: $pokemonSpecies}';
  }
}

class Names {
  String? name;
  NamedAPIResource? language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
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
    return 'Names{name: $name, language: $language}';
  }
}
