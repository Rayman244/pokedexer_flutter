import 'package:pokedexer_flutter/models/utils/common.dart';

class Generation {
  List<NamedAPIResource>? abilities;
  List<NamedAPIResource>? types;
  List<GenerationName>? names;
  NamedAPIResource? mainRegion;
  List<NamedAPIResource>? versionGroups;
  List<NamedAPIResource>? moves;
  String? name;
  int? id;
  List<NamedAPIResource>? pokemonSpecies;

  Generation(
      {this.abilities,
      this.types,
      this.names,
      this.mainRegion,
      this.versionGroups,
      this.moves,
      this.name,
      this.id,
      this.pokemonSpecies});

  Generation.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <NamedAPIResource>[];
      for (var v in (json['abilities'] as List)) {
        abilities!.add(NamedAPIResource.fromJson(v));
      }
    }
    if (json['types'] != null) {
      types = <NamedAPIResource>[];
      for (var v in (json['types'] as List)) {
        types!.add(NamedAPIResource.fromJson(v));
      }
    }
    if (json['names'] != null) {
      names = <GenerationName>[];
      for (var v in (json['names'] as List)) {
        names!.add(GenerationName.fromJson(v));
      }
    }
    mainRegion = json['main_region'] != null
        ? NamedAPIResource.fromJson(json['main_region'])
        : null;
    if (json['version_groups'] != null) {
      versionGroups = <NamedAPIResource>[];
      for (var v in (json['version_groups'] as List)) {
        versionGroups!.add(NamedAPIResource.fromJson(v));
      }
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      for (var v in (json['moves'] as List)) {
        moves!.add(NamedAPIResource.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
    if (json['pokemon_species'] != null) {
      pokemonSpecies = <NamedAPIResource>[];
      for (var v in (json['pokemon_species'] as List)) {
        pokemonSpecies!.add(NamedAPIResource.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilities != null) {
      data['abilities'] = [];
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (mainRegion != null) {
      data['main_region'] = mainRegion!.toJson();
    }
    if (versionGroups != null) {
      data['version_groups'] =
          versionGroups!.map((v) => v.toJson()).toList();
    }
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    if (pokemonSpecies != null) {
      data['pokemon_species'] =
          pokemonSpecies!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Generation{abilities: $abilities, types: $types, names: $names, mainRegion: $mainRegion, versionGroups: $versionGroups, moves: $moves, name: $name, id: $id, pokemonSpecies: $pokemonSpecies}';
  }
}

class GenerationName {
  String? name;
  NamedAPIResource? language;

  GenerationName({this.name, this.language});

  GenerationName.fromJson(Map<String, dynamic> json) {
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
    return 'GenerationName{name: $name, language: $language}';
  }
}
