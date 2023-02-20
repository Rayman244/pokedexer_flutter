import 'package:pokedexer_flutter/models/utils/common.dart';

class ItemFlingEffect {
  int? id;
  String? name;
  List<EffectEntries>? effectEntries;
  List<NamedAPIResource>? items;

  ItemFlingEffect({this.id, this.name, this.effectEntries, this.items});

  ItemFlingEffect.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['effect_entries'] != null) {
      effectEntries = <EffectEntries>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(EffectEntries.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <NamedAPIResource>[];
      json['items'].forEach((v) {
        items!.add(NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (effectEntries != null) {
      data['effect_entries'] =
          effectEntries!.map((v) => v.toJson()).toList();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ItemFlingEffect{id: $id, name: $name, effectEntries: $effectEntries, items: $items}';
  }
}

class EffectEntries {
  String? effect;
  NamedAPIResource? language;

  EffectEntries({this.effect, this.language});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['effect'] = effect;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'EffectEntries{effect: $effect, language: $language}';
  }
}
