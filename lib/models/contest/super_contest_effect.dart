import 'package:pokedexer_flutter/models/utils/common.dart';

class SuperContestEffect {
  List<NamedAPIResource>? moves;
  List<SuperContestEffectFlavorTextEntry>? flavorTextEntries;
  int? appeal;
  int? id;

  SuperContestEffect(
      {this.moves, this.flavorTextEntries, this.appeal, this.id});

  SuperContestEffect.fromJson(Map<String, dynamic> json) {
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      for (var v in (json['moves'] as List)) {
        moves!.add(NamedAPIResource.fromJson(v));
      }
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <SuperContestEffectFlavorTextEntry>[];
      for (var v in (json['flavor_text_entries'] as List)) {
        flavorTextEntries!.add(SuperContestEffectFlavorTextEntry.fromJson(v));
      }
    }
    appeal = json['appeal'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    if (flavorTextEntries != null) {
      data['flavor_text_entries'] =
          flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    data['appeal'] = appeal;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'SuperContestEffect{moves: $moves, flavorTextEntries: $flavorTextEntries, appeal: $appeal, id: $id}';
  }
}

class SuperContestEffectFlavorTextEntry {
  NamedAPIResource? language;
  String? flavorText;

  SuperContestEffectFlavorTextEntry({this.language, this.flavorText});

  SuperContestEffectFlavorTextEntry.fromJson(Map<String, dynamic> json) {
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
    return 'SuperContestEffectFlavorTextEntry{language: $language, flavorText: $flavorText}';
  }
}
