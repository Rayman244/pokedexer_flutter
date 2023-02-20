import 'package:pokedexer_flutter/models/utils/common.dart';

class MoveTarget {
  List<MoveTargetName>? names;
  List<NamedAPIResource>? moves;
  String? name;
  int? id;
  List<MoveTargetDescription>? descriptions;

  MoveTarget({this.names, this.moves, this.name, this.id, this.descriptions});

  MoveTarget.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <MoveTargetName>[];
      for (var v in (json['names'] as List)) {
        names!.add(MoveTargetName.fromJson(v));
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
    if (json['descriptions'] != null) {
      descriptions = <MoveTargetDescription>[];
      for (var v in (json['descriptions'] as List)) {
        descriptions!.add(MoveTargetDescription.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    if (descriptions != null) {
      data['descriptions'] = descriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveTarget{names: $names, moves: $moves, name: $name, id: $id, descriptions: $descriptions}';
  }
}

class MoveTargetName {
  String? name;
  NamedAPIResource? language;

  MoveTargetName({this.name, this.language});

  MoveTargetName.fromJson(Map<String, dynamic> json) {
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
    return 'MoveTargetName{name: $name, language: $language}';
  }
}

class MoveTargetDescription {
  String? description;
  NamedAPIResource? language;

  MoveTargetDescription({this.description, this.language});

  MoveTargetDescription.fromJson(Map<String, dynamic> json) {
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
    return 'MoveTargetDescription{description: $description, language: $language}';
  }
}
