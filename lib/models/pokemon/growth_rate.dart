import 'package:pokedexer_flutter/models/utils/common.dart';

class GrowthRate {
  int? id;
  String? name;
  String? formula;
  List<Descriptions>? descriptions;
  List<Levels>? levels;
  List<NamedAPIResource>? pokemonSpecies;

  GrowthRate(
      {this.id,
      this.name,
      this.formula,
      this.descriptions,
      this.levels,
      this.pokemonSpecies});

  GrowthRate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    formula = json['formula'];
    if (json['descriptions'] != null) {
      descriptions = <Descriptions>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Descriptions.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(Levels.fromJson(v));
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
    data['formula'] = formula;
    if (descriptions != null) {
      data['descriptions'] = descriptions!.map((v) => v.toJson()).toList();
    }
    if (levels != null) {
      data['levels'] = levels!.map((v) => v.toJson()).toList();
    }
    if (pokemonSpecies != null) {
      data['pokemon_species'] =
          pokemonSpecies!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'GrowthRate{id: $id, name: $name, formula: $formula, descriptions: $descriptions, levels: $levels, pokemonSpecies: $pokemonSpecies}';
  }
}

class Descriptions {
  String? description;
  NamedAPIResource? language;

  Descriptions({this.description, this.language});

  Descriptions.fromJson(Map<String, dynamic> json) {
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
    return 'Descriptions{description: $description, language: $language}';
  }
}

class Levels {
  int? level;
  int? experience;

  Levels({this.level, this.experience});

  Levels.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['experience'] = experience;
    return data;
  }

  @override
  String toString() {
    return 'Levels{level: $level, experience: $experience}';
  }
}
