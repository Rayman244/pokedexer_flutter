import 'package:pokedexer_flutter/models/utils/common.dart';

class BerryFirmness {
  int? id;
  String? name;
  List<NamedAPIResource>? berries;
  List<Names>? names;

  BerryFirmness({this.id, this.name, this.berries, this.names});

  BerryFirmness.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['berries'] != null) {
      berries = <NamedAPIResource>[];
      json['berries'].forEach((v) {
        berries!.add( NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names =  <Names>[];
      json['names'].forEach((v) {
        names!.add( Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (berries != null) {
      data['berries'] = berries!.map((v) => v.toJson()).toList();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'BerryFirmness{id: $id, name: $name, berries: $berries, names: $names}';
  }
}

class Names {
  String? name;
  NamedAPIResource? language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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
