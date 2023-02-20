import 'package:pokedexer_flutter/models/utils/common.dart';

class Type {
  int? id;
  String? name;
  DamageRelations? damageRelations;
  List<GameIndices>? gameIndices;
  NamedAPIResource? generation;
  NamedAPIResource? moveDamageClass;
  List<Names>? names;
  List<TypePokemon>? pokemon;
  List<NamedAPIResource>? moves;

  Type(
      {this.id,
      this.name,
      this.damageRelations,
      this.gameIndices,
      this.generation,
      this.moveDamageClass,
      this.names,
      this.pokemon,
      this.moves});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    damageRelations = json['damage_relations'] != null
        ? DamageRelations.fromJson(json['damage_relations'])
        : null;
    if (json['game_indices'] != null) {
      gameIndices = <GameIndices>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(GameIndices.fromJson(v));
      });
    }
    generation = json['generation'] != null
        ? NamedAPIResource.fromJson(json['generation'])
        : null;
    moveDamageClass = json['move_damage_class'] != null
        ? NamedAPIResource.fromJson(json['move_damage_class'])
        : null;
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(Names.fromJson(v));
      });
    }
    if (json['pokemon'] != null) {
      pokemon = <TypePokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(TypePokemon.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      json['moves'].forEach((v) {
        moves!.add(NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (damageRelations != null) {
      data['damage_relations'] = damageRelations!.toJson();
    }
    if (gameIndices != null) {
      data['game_indices'] = gameIndices!.map((v) => v.toJson()).toList();
    }
    if (generation != null) {
      data['generation'] = generation!.toJson();
    }
    if (moveDamageClass != null) {
      data['move_damage_class'] = moveDamageClass!.toJson();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (pokemon != null) {
      data['pokemon'] = pokemon!.map((v) => v.toJson()).toList();
    }
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DamageRelations {
  List<NamedAPIResource>? noDamageTo;
  List<NamedAPIResource>? halfDamageTo;
  List<NamedAPIResource>? doubleDamageTo;
  List<NamedAPIResource>? noDamageFrom;
  List<NamedAPIResource>? halfDamageFrom;
  List<NamedAPIResource>? doubleDamageFrom;

  DamageRelations(
      {this.noDamageTo,
      this.halfDamageTo,
      this.doubleDamageTo,
      this.noDamageFrom,
      this.halfDamageFrom,
      this.doubleDamageFrom});

  DamageRelations.fromJson(Map<String, dynamic> json) {
    if (json['no_damage_to'] != null) {
      noDamageTo = <NamedAPIResource>[];
      json['no_damage_to'].forEach((v) {
        noDamageTo!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['half_damage_to'] != null) {
      halfDamageTo = <NamedAPIResource>[];
      json['half_damage_to'].forEach((v) {
        halfDamageTo!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['double_damage_to'] != null) {
      doubleDamageTo = <NamedAPIResource>[];
      json['double_damage_to'].forEach((v) {
        doubleDamageTo!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['no_damage_from'] != null) {
      noDamageFrom = <NamedAPIResource>[];
      json['no_damage_from'].forEach((v) {
        noDamageFrom!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['half_damage_from'] != null) {
      halfDamageFrom = <NamedAPIResource>[];
      json['half_damage_from'].forEach((v) {
        halfDamageFrom!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['double_damage_from'] != null) {
      doubleDamageFrom = <NamedAPIResource>[];
      json['double_damage_from'].forEach((v) {
        doubleDamageFrom!.add(NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (noDamageTo != null) {
      data['no_damage_to'] = noDamageTo!.map((v) => v.toJson()).toList();
    }
    if (halfDamageTo != null) {
      data['half_damage_to'] =
          halfDamageTo!.map((v) => v.toJson()).toList();
    }
    if (doubleDamageTo != null) {
      data['double_damage_to'] =
          doubleDamageTo!.map((v) => v.toJson()).toList();
    }
    if (noDamageFrom != null) {
      data['no_damage_from'] =
          noDamageFrom!.map((v) => v.toJson()).toList();
    }
    if (halfDamageFrom != null) {
      data['half_damage_from'] =
          halfDamageFrom!.map((v) => v.toJson()).toList();
    }
    if (doubleDamageFrom != null) {
      data['double_damage_from'] =
          doubleDamageFrom!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GameIndices {
  int? gameIndex;
  NamedAPIResource? generation;

  GameIndices({this.gameIndex, this.generation});

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    generation = json['generation'] != null
        ? NamedAPIResource.fromJson(json['generation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_index'] = gameIndex;
    if (generation != null) {
      data['generation'] = generation!.toJson();
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

class TypePokemon {
  int? slot;
  NamedAPIResource? pokemon;

  TypePokemon({this.slot, this.pokemon});

  TypePokemon.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    pokemon = json['pokemon'] != null
        ? NamedAPIResource.fromJson(json['pokemon'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (pokemon != null) {
      data['pokemon'] = pokemon!.toJson();
    }
    return data;
  }
}
