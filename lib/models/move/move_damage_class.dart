import 'package:pokedexer_flutter/models/utils/common.dart';

class MoveDamageClass {
  List<MoveDamageClassName>? names;
  List<NamedAPIResource>? moves;
  String? name;
  int? id;
  List<MoveDamageClassDescription>? descriptions;

  MoveDamageClass(
      {this.names, this.moves, this.name, this.id, this.descriptions});

  MoveDamageClass.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <MoveDamageClassName>[];
      for (var v in (json['names'] as List)) {
        names!.add(MoveDamageClassName.fromJson(v));
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
      descriptions = <MoveDamageClassDescription>[];
      for (var v in (json['descriptions'] as List)) {
        descriptions!.add(MoveDamageClassDescription.fromJson(v));
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
    return 'MoveDamageClass{names: $names, moves: $moves, name: $name, id: $id, descriptions: $descriptions}';
  }
}

class MoveDamageClassName {
  String? name;
  NamedAPIResource? language;

  MoveDamageClassName({this.name, this.language});

  MoveDamageClassName.fromJson(Map<String, dynamic> json) {
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
}

class MoveDamageClassDescription {
  String? description;
  NamedAPIResource? language;

  MoveDamageClassDescription({this.description, this.language});

  MoveDamageClassDescription.fromJson(Map<String, dynamic> json) {
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
    return 'MoveDamageClassDescription{description: $description, language: $language}';
  }
}
