import 'package:pokedexer_flutter/models/utils/common.dart';

class MoveCategory {
  List<NamedAPIResource>? moves;
  String? name;
  int? id;
  List<MoveCategoryDescription>? descriptions;

  MoveCategory({this.moves, this.name, this.id, this.descriptions});

  MoveCategory.fromJson(Map<String, dynamic> json) {
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      for (var v in (json['moves'] as List)) {
        moves!.add(NamedAPIResource.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
    if (json['descriptions'] != null) {
      descriptions = <MoveCategoryDescription>[];
      for (var v in (json['descriptions'] as List)) {
        descriptions!.add(MoveCategoryDescription.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    return 'MoveCategory{moves: $moves, name: $name, id: $id, descriptions: $descriptions}';
  }
}

class MoveCategoryDescription {
  String? description;
  NamedAPIResource? language;

  MoveCategoryDescription({this.description, this.language});

  MoveCategoryDescription.fromJson(Map<String, dynamic> json) {
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
    return 'MoveCategoryDescription{description: $description, language: $language}';
  }
}
