import 'package:pokedexer_flutter/models/utils/common.dart';

class Gender {
  int? id;
  String? name;
  List<PokemonSpeciesDetails>? pokemonSpeciesDetails;
  List<NamedAPIResource>? requiredForEvolution;

  Gender(
      {this.id,
      this.name,
      this.pokemonSpeciesDetails,
      this.requiredForEvolution});

  Gender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['pokemon_species_details'] != null) {
      pokemonSpeciesDetails = <PokemonSpeciesDetails>[];
      json['pokemon_species_details'].forEach((v) {
        pokemonSpeciesDetails!.add(PokemonSpeciesDetails.fromJson(v));
      });
    }
    if (json['required_for_evolution'] != null) {
      requiredForEvolution = <NamedAPIResource>[];
      json['required_for_evolution'].forEach((v) {
        requiredForEvolution!.add(NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (pokemonSpeciesDetails != null) {
      data['pokemon_species_details'] =
          pokemonSpeciesDetails!.map((v) => v.toJson()).toList();
    }
    if (requiredForEvolution != null) {
      data['required_for_evolution'] =
          requiredForEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Gender{id: $id, name: $name, pokemonSpeciesDetails: $pokemonSpeciesDetails, requiredForEvolution: $requiredForEvolution}';
  }
}

class PokemonSpeciesDetails {
  int? rate;
  NamedAPIResource? pokemonSpecies;

  PokemonSpeciesDetails({this.rate, this.pokemonSpecies});

  PokemonSpeciesDetails.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    pokemonSpecies = json['pokemon_species'] != null
        ? NamedAPIResource.fromJson(json['pokemon_species'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    if (pokemonSpecies != null) {
      data['pokemon_species'] = pokemonSpecies!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokemonSpeciesDetails{rate: $rate, pokemonSpecies: $pokemonSpecies}';
  }
}
