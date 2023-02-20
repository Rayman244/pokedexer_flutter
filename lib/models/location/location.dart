import 'package:pokedexer_flutter/models/utils/common.dart';

class Location {
  List<LocationGameIndex>? gameIndices;
  List<LocationName>? names;
  String? name;
  List<NamedAPIResource>? areas;
  int? id;
  NamedAPIResource? region;

  Location(
      {this.gameIndices,
      this.names,
      this.name,
      this.areas,
      this.id,
      this.region});

  Location.fromJson(Map<String, dynamic> json) {
    if (json['game_indices'] != null) {
      gameIndices = <LocationGameIndex>[];
      for (var v in (json['game_indices'] as List)) {
        gameIndices!.add(LocationGameIndex.fromJson(v));
      }
    }
    if (json['names'] != null) {
      names = <LocationName>[];
      for (var v in (json['names'] as List)) {
        names!.add(LocationName.fromJson(v));
      }
    }
    name = json['name'];
    if (json['areas'] != null) {
      areas = <NamedAPIResource>[];
      for (var v in (json['areas'] as List)) {
        areas!.add(NamedAPIResource.fromJson(v));
      }
    }
    id = json['id'];
    region = json['region'] != null
        ? NamedAPIResource.fromJson(json['region'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (gameIndices != null) {
      data['game_indices'] = gameIndices!.map((v) => v.toJson()).toList();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    if (areas != null) {
      data['areas'] = areas!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    if (region != null) {
      data['region'] = region!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Location{gameIndices: $gameIndices, names: $names, name: $name, areas: $areas, id: $id, region: $region}';
  }
}

class LocationGameIndex {
  NamedAPIResource? generation;
  int? gameIndex;

  LocationGameIndex({this.generation, this.gameIndex});

  LocationGameIndex.fromJson(Map<String, dynamic> json) {
    generation = json['generation'] != null
        ? NamedAPIResource.fromJson(json['generation'])
        : null;
    gameIndex = json['game_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (generation != null) {
      data['generation'] = generation!.toJson();
    }
    data['game_index'] = gameIndex;
    return data;
  }

  @override
  String toString() {
    return 'LocationGameIndex{generation: $generation, gameIndex: $gameIndex}';
  }
}

class LocationName {
  String? name;
  NamedAPIResource? language;

  LocationName({this.name, this.language});

  LocationName.fromJson(Map<String, dynamic> json) {
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
    return 'LocationName{name: $name, language: $language}';
  }
}
