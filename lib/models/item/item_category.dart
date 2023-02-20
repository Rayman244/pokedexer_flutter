import 'package:pokedexer_flutter/models/utils/common.dart';

class ItemCategory {
  int? id;
  String? name;
  List<NamedAPIResource>? items;
  List<NamedAPIResource>? names;
  NamedAPIResource? pocket;

  ItemCategory({this.id, this.name, this.items, this.names, this.pocket});

  ItemCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['items'] != null) {
      items = <NamedAPIResource>[];
      json['items'].forEach((v) {
        items!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <NamedAPIResource>[];
      json['names'].forEach((v) {
        v = v['language'];
        names!.add(NamedAPIResource.fromJson(v));
      });
    }
    pocket = json['pocket'] != null
        ? NamedAPIResource.fromJson(json['pocket'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (pocket != null) {
      data['pocket'] = pocket!.toJson();
    }
    return data;
  }
}

class Language {
  String? name;
  String? url;

  Language({this.name, this.url});

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
