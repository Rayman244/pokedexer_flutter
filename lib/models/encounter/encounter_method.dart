import 'package:pokedexer_flutter/models/utils/common.dart';

class EncounterMethod {
  List<EncounterMethodName>? names;
  String? name;
  int? id;
  int? order;

  EncounterMethod({this.names, this.name, this.id, this.order});

  EncounterMethod.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <EncounterMethodName>[];
      for (var v in (json['names'] as List)) {
        names!.add(EncounterMethodName.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    data['order'] = order;
    return data;
  }

  @override
  String toString() {
    return 'EncounterMethod{names: $names, name: $name, id: $id, order: $order}';
  }
}

class EncounterMethodName {
  String? name;
  NamedAPIResource? language;

  EncounterMethodName({this.name, this.language});

  EncounterMethodName.fromJson(Map<String, dynamic> json) {
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
    return 'EncounterMethodName{name: $name, language: $language}';
  }
}
