import 'package:pokedexer_flutter/models/utils/common.dart';

class Language {
  int? id;
  String? name;
  bool? official;
  String? iso639;
  String? iso3166;
  List<Names>? names;

  Language(
      {this.id,
      this.name,
      this.official,
      this.iso639,
      this.iso3166,
      this.names});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    official = json['official'];
    iso639 = json['iso639'];
    iso3166 = json['iso3166'];
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
    data['official'] = official;
    data['iso639'] = iso639;
    data['iso3166'] = iso3166;
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
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
}
