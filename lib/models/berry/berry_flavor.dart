import 'package:pokedexer_flutter/models/utils/common.dart';


class BerryFlavor {
  int? id;
  String? name;
  List<Berries>? berries;
  NamedAPIResource? contestType;
  List<Names>? names;

  BerryFlavor({this.id, this.name, this.berries, this.contestType, this.names});

  BerryFlavor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['berries'] != null) {
      berries =  <Berries>[];
      json['berries'].forEach((v) {
        berries!.add( Berries.fromJson(v));
      });
    }
    contestType = json['contest_type'] != null
        ?  NamedAPIResource.fromJson(json['contest_type'])
        : null;
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
    if (contestType != null) {
      data['contest_type'] = contestType!.toJson();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'BerryFlavor{id: $id, name: $name, berries: $berries, contestType: $contestType, names: $names}';
  }
}

class Berries {
  int? potency;
  NamedAPIResource? berry;

  Berries({this.potency, this.berry});

  Berries.fromJson(Map<String, dynamic> json) {
    potency = json['potency'];
    berry = json['berry'] != null
        ?  NamedAPIResource.fromJson(json['berry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['potency'] = potency;
    if (berry != null) {
      data['berry'] = berry!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Berries{potency: $potency, berry: $berry}';
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
