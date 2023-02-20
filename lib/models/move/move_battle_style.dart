import 'package:pokedexer_flutter/models/utils/common.dart';

class MoveBattleStyle {
  List<MoveBattleStyleName>? names;
  String? name;
  int? id;

  MoveBattleStyle({this.names, this.name, this.id});

  MoveBattleStyle.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <MoveBattleStyleName>[];
      for (var v in (json['names'] as List)) {
        names!.add(MoveBattleStyleName.fromJson(v));
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
    data['name'] = name;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'MoveBattleStyle{names: $names, name: $name, id: $id}';
  }
}

class MoveBattleStyleName {
  String? name;
  NamedAPIResource? language;

  MoveBattleStyleName({this.name, this.language});

  MoveBattleStyleName.fromJson(Map<String, dynamic> json) {
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
    return 'MoveBattleStyleName{name: $name, language: $language}';
  }
}
