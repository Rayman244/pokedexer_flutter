import 'package:pokedexer_flutter/models/utils/common.dart';

class PokemonShape {
  int? id;
  String? name;
  List<AwesomeNames>? awesomeNames;
  List<Names>? names;
  List<NamedAPIResource>? pokemonSpecies;

  PokemonShape(
      {this.id, this.name, this.awesomeNames, this.names, this.pokemonSpecies});

  PokemonShape.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['awesome_names'] != null) {
      awesomeNames = <AwesomeNames>[];
      json['awesome_names'].forEach((v) {
        awesomeNames!.add(AwesomeNames.fromJson(v));
      });
    }
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
    if (awesomeNames != null) {
      data['awesome_names'] =
          awesomeNames!.map((v) => v.toJson()).toList();
    }
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
    return 'PokemonShape{id: $id, name: $name, awesomeNames: $awesomeNames, names: $names, pokemonSpecies: $pokemonSpecies}';
  }
}

class AwesomeNames {
  String? awesomeName;
  NamedAPIResource? language;

  AwesomeNames({this.awesomeName, this.language});

  AwesomeNames.fromJson(Map<String, dynamic> json) {
    awesomeName = json['awesome_name'];
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['awesome_name'] = awesomeName;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'AwesomeNames{awesomeName: $awesomeName, language: $language}';
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
