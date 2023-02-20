import 'package:pokedexer_flutter/models/utils/common.dart';

class Nature {
  int? id;
  String? name;
  NamedAPIResource? decreasedStat;
  NamedAPIResource? increasedStat;
  NamedAPIResource? likesFlavor;
  NamedAPIResource? hatesFlavor;
  List<PokeathlonStatChanges>? pokeathlonStatChanges;
  List<MoveBattleStylePreferences>? moveBattleStylePreferences;
  List<Names>? names;

  Nature(
      {this.id,
      this.name,
      this.decreasedStat,
      this.increasedStat,
      this.likesFlavor,
      this.hatesFlavor,
      this.pokeathlonStatChanges,
      this.moveBattleStylePreferences,
      this.names});

  Nature.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    decreasedStat = json['decreased_stat'] != null
        ? NamedAPIResource.fromJson(json['decreased_stat'])
        : null;
    increasedStat = json['increased_stat'] != null
        ? NamedAPIResource.fromJson(json['increased_stat'])
        : null;
    likesFlavor = json['likes_flavor'] != null
        ? NamedAPIResource.fromJson(json['likes_flavor'])
        : null;
    hatesFlavor = json['hates_flavor'] != null
        ? NamedAPIResource.fromJson(json['hates_flavor'])
        : null;
    if (json['pokeathlon_stat_changes'] != null) {
      pokeathlonStatChanges = <PokeathlonStatChanges>[];
      json['pokeathlon_stat_changes'].forEach((v) {
        pokeathlonStatChanges!.add(PokeathlonStatChanges.fromJson(v));
      });
    }
    if (json['move_battle_style_preferences'] != null) {
      moveBattleStylePreferences = <MoveBattleStylePreferences>[];
      json['move_battle_style_preferences'].forEach((v) {
        moveBattleStylePreferences!.add(MoveBattleStylePreferences.fromJson(v));
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
    if (decreasedStat != null) {
      data['decreased_stat'] = decreasedStat!.toJson();
    }
    if (increasedStat != null) {
      data['increased_stat'] = increasedStat!.toJson();
    }
    if (likesFlavor != null) {
      data['likes_flavor'] = likesFlavor!.toJson();
    }
    if (hatesFlavor != null) {
      data['hates_flavor'] = hatesFlavor!.toJson();
    }
    if (pokeathlonStatChanges != null) {
      data['pokeathlon_stat_changes'] =
          pokeathlonStatChanges!.map((v) => v.toJson()).toList();
    }
    if (moveBattleStylePreferences != null) {
      data['move_battle_style_preferences'] =
          moveBattleStylePreferences!.map((v) => v.toJson()).toList();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Nature{id: $id, name: $name, decreasedStat: $decreasedStat, increasedStat: $increasedStat, likesFlavor: $likesFlavor, hatesFlavor: $hatesFlavor, pokeathlonStatChanges: $pokeathlonStatChanges, moveBattleStylePreferences: $moveBattleStylePreferences, names: $names}';
  }
}

class PokeathlonStatChanges {
  int? maxChange;
  NamedAPIResource? pokeathlonStat;

  PokeathlonStatChanges({this.maxChange, this.pokeathlonStat});

  PokeathlonStatChanges.fromJson(Map<String, dynamic> json) {
    maxChange = json['max_change'];
    pokeathlonStat = json['pokeathlon_stat'] != null
        ? NamedAPIResource.fromJson(json['pokeathlon_stat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max_change'] = maxChange;
    if (pokeathlonStat != null) {
      data['pokeathlon_stat'] = pokeathlonStat!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokeathlonStatChanges{maxChange: $maxChange, pokeathlonStat: $pokeathlonStat}';
  }
}

class MoveBattleStylePreferences {
  int? lowHpPreference;
  int? highHpPreference;
  NamedAPIResource? moveBattleStyle;

  MoveBattleStylePreferences(
      {this.lowHpPreference, this.highHpPreference, this.moveBattleStyle});

  MoveBattleStylePreferences.fromJson(Map<String, dynamic> json) {
    lowHpPreference = json['low_hp_preference'];
    highHpPreference = json['high_hp_preference'];
    moveBattleStyle = json['move_battle_style'] != null
        ? NamedAPIResource.fromJson(json['move_battle_style'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['low_hp_preference'] = lowHpPreference;
    data['high_hp_preference'] = highHpPreference;
    if (moveBattleStyle != null) {
      data['move_battle_style'] = moveBattleStyle!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveBattleStylePreferences{lowHpPreference: $lowHpPreference, highHpPreference: $highHpPreference, moveBattleStyle: $moveBattleStyle}';
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
