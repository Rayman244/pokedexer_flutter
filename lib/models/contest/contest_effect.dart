import 'package:pokedexer_flutter/models/utils/common.dart';

class ContestEffect {
  List<ContestEffectEffectEntry>? effectEntries;
  List<ContestEffectFlavorTextEntry>? flavorTextEntries;
  int? jam;
  int? appeal;
  int? id;

  ContestEffect(
      {this.effectEntries,
      this.flavorTextEntries,
      this.jam,
      this.appeal,
      this.id});

  ContestEffect.fromJson(Map<String, dynamic> json) {
    if (json['effect_entries'] != null) {
      effectEntries = <ContestEffectEffectEntry>[];
      for (var v in (json['effect_entries'] as List)) {
        effectEntries!.add(ContestEffectEffectEntry.fromJson(v));
      }
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <ContestEffectFlavorTextEntry>[];
      for (var v in (json['flavor_text_entries'] as List)) {
        flavorTextEntries!.add(ContestEffectFlavorTextEntry.fromJson(v));
      }
    }
    jam = json['jam'];
    appeal = json['appeal'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (effectEntries != null) {
      data['effect_entries'] =
          effectEntries!.map((v) => v.toJson()).toList();
    }
    if (flavorTextEntries != null) {
      data['flavor_text_entries'] =
          flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    data['jam'] = jam;
    data['appeal'] = appeal;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'ContestEffect{effectEntries: $effectEntries, flavorTextEntries: $flavorTextEntries, jam: $jam, appeal: $appeal, id: $id}';
  }
}

class ContestEffectEffectEntry {
  String? effect;
  NamedAPIResource? language;

  ContestEffectEffectEntry({this.effect, this.language});

  ContestEffectEffectEntry.fromJson(Map<String, dynamic> json) {
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
    return 'ContestEffectEffectEntry{effect: $effect, language: $language}';
  }
}

class ContestEffectFlavorTextEntry {
  NamedAPIResource? language;
  String? flavorText;

  ContestEffectFlavorTextEntry({this.language, this.flavorText});

  ContestEffectFlavorTextEntry.fromJson(Map<String, dynamic> json) {
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
    flavorText = json['flavor_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (language != null) {
      data['language'] = language!.toJson();
    }
    data['flavor_text'] = flavorText;
    return data;
  }

  @override
  String toString() {
    return 'ContestEffectFlavorTextEntry{language: $language, flavorText: $flavorText}';
  }
}
