import 'package:pokedexer_flutter/models/utils/common.dart';

class ItemAbility {
  int? id;
  String? name;
  List<Descriptions>? descriptions;
  List<NamedAPIResource>? items;
  List<Names>? names;

  ItemAbility({this.id, this.name, this.descriptions, this.items, this.names});

  ItemAbility.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['descriptions'] != null) {
      descriptions = <Descriptions>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Descriptions.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <NamedAPIResource>[];
      json['items'].forEach((v) {
        items!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (descriptions != null) {
      data['descriptions'] = descriptions!.map((v) => v.toJson()).toList();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ItemAbility{id: $id, name: $name, descriptions: $descriptions, items: $items, names: $names}';
  }
}

class Descriptions {
  String? description;
  NamedAPIResource? language;

  Descriptions({this.description, this.language});

  Descriptions.fromJson(Map<String, dynamic> json) {
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
    return 'Descriptions{description: $description, language: $language}';
  }
}

class Names {
  String? name;
  NamedAPIResource? language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
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
    return 'Names{name: $name, language: $language}';
  }
}
