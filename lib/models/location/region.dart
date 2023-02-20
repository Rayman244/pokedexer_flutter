import 'package:pokedexer_flutter/models/utils/common.dart';

class Region {
  NamedAPIResource? mainGeneration;
  List<RegionName>? names;
  List<NamedAPIResource>? pokedexes;
  List<NamedAPIResource>? versionGroups;
  String? name;
  List<NamedAPIResource>? locations;
  int? id;

  Region(
      {this.mainGeneration,
      this.names,
      this.pokedexes,
      this.versionGroups,
      this.name,
      this.locations,
      this.id});

  Region.fromJson(Map<String, dynamic> json) {
    mainGeneration = json['main_generation'] != null
        ? NamedAPIResource.fromJson(json['main_generation'])
        : null;
    if (json['names'] != null) {
      names = <RegionName>[];
      for (var v in (json['names'] as List)) {
        names!.add(RegionName.fromJson(v));
      }
    }
    if (json['pokedexes'] != null) {
      pokedexes = <NamedAPIResource>[];
      for (var v in (json['pokedexes'] as List)) {
        pokedexes!.add(NamedAPIResource.fromJson(v));
      }
    }
    if (json['version_groups'] != null) {
      versionGroups = <NamedAPIResource>[];
      for (var v in (json['version_groups'] as List)) {
        versionGroups!.add(NamedAPIResource.fromJson(v));
      }
    }
    name = json['name'];
    if (json['locations'] != null) {
      locations = <NamedAPIResource>[];
      for (var v in (json['locations'] as List)) {
        locations!.add(NamedAPIResource.fromJson(v));
      }
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mainGeneration != null) {
      data['main_generation'] = mainGeneration!.toJson();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (pokedexes != null) {
      data['pokedexes'] = pokedexes!.map((v) => v.toJson()).toList();
    }
    if (versionGroups != null) {
      data['version_groups'] =
          versionGroups!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'Region{mainGeneration: $mainGeneration, names: $names, pokedexes: $pokedexes, versionGroups: $versionGroups, name: $name, locations: $locations, id: $id}';
  }
}

class RegionName {
  String? name;
  NamedAPIResource? language;

  RegionName({this.name, this.language});

  RegionName.fromJson(Map<String, dynamic> json) {
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
    return 'RegionName{name: $name, language: $language}';
  }
}
