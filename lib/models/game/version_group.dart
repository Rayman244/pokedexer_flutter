import 'package:pokedexer_flutter/models/utils/common.dart';

class VersionGroup {
  NamedAPIResource? generation;
  List<NamedAPIResource>? regions;
  List<NamedAPIResource>? pokedexes;
  List<NamedAPIResource>? versions;
  String? name;
  int? id;
  List<NamedAPIResource>? moveLearnMethods;
  int? order;

  VersionGroup(
      {this.generation,
      this.regions,
      this.pokedexes,
      this.versions,
      this.name,
      this.id,
      this.moveLearnMethods,
      this.order});

  VersionGroup.fromJson(Map<String, dynamic> json) {
    generation = json['generation'] != null
        ? NamedAPIResource.fromJson(json['generation'])
        : null;
    if (json['regions'] != null) {
      regions = <NamedAPIResource>[];
      for (var v in (json['regions'] as List)) {
        regions!.add(NamedAPIResource.fromJson(v));
      }
    }
    if (json['pokedexes'] != null) {
      pokedexes = <NamedAPIResource>[];
      for (var v in (json['pokedexes'] as List)) {
        pokedexes!.add(NamedAPIResource.fromJson(v));
      }
    }
    if (json['versions'] != null) {
      versions = <NamedAPIResource>[];
      for (var v in (json['versions'] as List)) {
        versions!.add(NamedAPIResource.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
    if (json['move_learn_methods'] != null) {
      moveLearnMethods = <NamedAPIResource>[];
      for (var v in (json['move_learn_methods'] as List)) {
        moveLearnMethods!.add(NamedAPIResource.fromJson(v));
      }
    }
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (generation != null) {
      data['generation'] = generation!.toJson();
    }
    if (regions != null) {
      data['regions'] = regions!.map((v) => v.toJson()).toList();
    }
    if (pokedexes != null) {
      data['pokedexes'] = pokedexes!.map((v) => v.toJson()).toList();
    }
    if (versions != null) {
      data['versions'] = versions!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    if (moveLearnMethods != null) {
      data['move_learn_methods'] =
          moveLearnMethods!.map((v) => v.toJson()).toList();
    }
    data['order'] = order;
    return data;
  }

  @override
  String toString() {
    return 'VersionGroupEntity{generation: $generation, regions: $regions, pokedexes: $pokedexes, versions: $versions, name: $name, id: $id, moveLearnMethods: $moveLearnMethods, order: $order}';
  }
}
