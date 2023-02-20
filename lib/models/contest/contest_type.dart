import 'package:pokedexer_flutter/models/utils/common.dart';

class ContestType {
  NamedAPIResource? berryFlavor;
  List<ContestTypeName>? names;
  String? name;
  int? id;

  ContestType({this.berryFlavor, this.names, this.name, this.id});

  ContestType.fromJson(Map<String, dynamic> json) {
    berryFlavor = json['berry_flavor'] != null
        ? NamedAPIResource.fromJson(json['berry_flavor'])
        : null;
    if (json['names'] != null) {
      names = <ContestTypeName>[];
      for (var v in (json['names'] as List)) {
        names!.add(ContestTypeName.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (berryFlavor != null) {
      data['berry_flavor'] = berryFlavor!.toJson();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'ContestType{berryFlavor: $berryFlavor, names: $names, name: $name, id: $id}';
  }
}

class ContestTypeName {
  String? color;
  String? name;
  NamedAPIResource? language;

  ContestTypeName({this.color, this.name, this.language});

  ContestTypeName.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    name = json['name'];
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['name'] = name;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ContestTypeName{color: $color, name: $name, language: $language}';
  }
}
