import 'package:pokedexer_flutter/models/utils/common.dart';

class Pokedex {
  bool? isMainSeries;
  List<PokedexPokemonEntry>? pokemonEntries;
  List<PokedexName>? names;
  List<NamedAPIResource>? versionGroups;
  String? name;
  int? id;
  dynamic region;
  List<PokedexDescription>? descriptions;

  Pokedex(
      {this.isMainSeries,
      this.pokemonEntries,
      this.names,
      this.versionGroups,
      this.name,
      this.id,
      this.region,
      this.descriptions});

  Pokedex.fromJson(Map<String, dynamic> json) {
    isMainSeries = json['is_main_series'];
    if (json['pokemon_entries'] != null) {
      pokemonEntries = <PokedexPokemonEntry>[];
      for (var v in (json['pokemon_entries'] as List)) {
        pokemonEntries!.add(PokedexPokemonEntry.fromJson(v));
      }
    }
    if (json['names'] != null) {
      names = <PokedexName>[];
      for (var v in (json['names'] as List)) {
        names!.add(PokedexName.fromJson(v));
      }
    }
    if (json['version_groups'] != null) {
      versionGroups = <NamedAPIResource>[];
      for (var v in (json['version_groups'] as List)) {
        versionGroups!.add(NamedAPIResource.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
    region = json['region'];
    if (json['descriptions'] != null) {
      descriptions = <PokedexDescription>[];
      for (var v in (json['descriptions'] as List)) {
        descriptions!.add(PokedexDescription.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_main_series'] = isMainSeries;
    if (pokemonEntries != null) {
      data['pokemon_entries'] =
          pokemonEntries!.map((v) => v.toJson()).toList();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (versionGroups != null) {
      data['version_groups'] = [];
    }
    data['name'] = name;
    data['id'] = id;
    data['region'] = region;
    if (descriptions != null) {
      data['descriptions'] = descriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Pokedex{isMainSeries: $isMainSeries, pokemonEntries: $pokemonEntries, names: $names, versionGroups: $versionGroups, name: $name, id: $id, region: $region, descriptions: $descriptions}';
  }
}

class PokedexPokemonEntry {
  int? entryNumber;
  NamedAPIResource? pokemonSpecies;

  PokedexPokemonEntry({this.entryNumber, this.pokemonSpecies});

  PokedexPokemonEntry.fromJson(Map<String, dynamic> json) {
    entryNumber = json['entry_number'];
    pokemonSpecies = json['pokemon_species'] != null
        ? NamedAPIResource.fromJson(json['pokemon_species'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['entry_number'] = entryNumber;
    if (pokemonSpecies != null) {
      data['pokemon_species'] = pokemonSpecies!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokedexPokemonEntry{entryNumber: $entryNumber, pokemonSpecies: $pokemonSpecies}';
  }
}

class PokedexName {
  String? name;
  NamedAPIResource? language;

  PokedexName({this.name, this.language});

  PokedexName.fromJson(Map<String, dynamic> json) {
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
    return 'PokedexName{name: $name, language: $language}';
  }
}

class PokedexDescription {
  String? description;
  NamedAPIResource? language;

  PokedexDescription({this.description, this.language});

  PokedexDescription.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokedexDescription{description: $description, language: $language}';
  }
}
