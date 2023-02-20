import 'package:pokedexer_flutter/models/utils/common.dart';

class MoveAilment {
  List<MoveAilmantNames>? names;
  List<NamedAPIResource>? moves;
  String? name;
  int? id;

  MoveAilment({this.names, this.moves, this.name, this.id});

  MoveAilment.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <MoveAilmantNames>[];
      for (var v in (json['names'] as List)) {
        names!.add(MoveAilmantNames.fromJson(v));
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
    return data;
  }

  @override
  String toString() {
    return 'MoveAilment{names: $names, moves: $moves, name: $name, id: $id}';
  }
}

class MoveAilmantNames {
  String? name;
  NamedAPIResource? language;

  MoveAilmantNames({this.name, this.language});

  MoveAilmantNames.fromJson(Map<String, dynamic> json) {
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
    return 'MoveAilmantNames{name: $name, language: $language}';
  }
}
