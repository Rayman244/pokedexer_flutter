import 'package:pokedexer_flutter/models/utils/common.dart';

class ItemPocket {
  int? id;
  String? name;
  List<NamedAPIResource>? categories;
  List<Names>? names;

  ItemPocket({this.id, this.name, this.categories, this.names});

  ItemPocket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['categories'] != null) {
      categories = <NamedAPIResource>[];
      json['categories'].forEach((v) {
        categories!.add(NamedAPIResource.fromJson(v));
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
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ItemPocket{id: $id, name: $name, categories: $categories, names: $names}';
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
