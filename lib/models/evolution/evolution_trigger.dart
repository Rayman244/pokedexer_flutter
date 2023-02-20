import 'package:pokedexer_flutter/models/utils/common.dart';

class EvolutionTrigger {
  List<EvolutionTriggerName>? names;
  String? name;
  int? id;
  List<NamedAPIResource>? pokemonSpecies;

  EvolutionTrigger({this.names, this.name, this.id, this.pokemonSpecies});

  EvolutionTrigger.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <EvolutionTriggerName>[];
      for (var v in (json['names'] as List)) {
        names!.add(EvolutionTriggerName.fromJson(v));
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
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
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
    return 'EvolutionTrigger{names: $names, name: $name, id: $id, pokemonSpecies: $pokemonSpecies}';
  }
}

class EvolutionTriggerName {
  String? name;
  NamedAPIResource? language;

  EvolutionTriggerName({this.name, this.language});

  EvolutionTriggerName.fromJson(Map<String, dynamic> json) {
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
    return 'EvolutionTriggerName{name: $name, language: $language}';
  }
}
