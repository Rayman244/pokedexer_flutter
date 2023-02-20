import 'package:pokedexer_flutter/models/utils/common.dart';

class Stat {
  int? id;
  String? name;
  int? gameIndex;
  bool? isBattleOnly;
  AffectingMoves? affectingMoves;
  AffectingNatures? affectingNatures;
  List<Characteristics>? characteristics;
  NamedAPIResource? moveDamageClass;
  List<Names>? names;

  Stat(
      {this.id,
      this.name,
      this.gameIndex,
      this.isBattleOnly,
      this.affectingMoves,
      this.affectingNatures,
      this.characteristics,
      this.moveDamageClass,
      this.names});

  Stat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gameIndex = json['game_index'];
    isBattleOnly = json['is_battle_only'];
    affectingMoves = json['affecting_moves'] != null
        ? AffectingMoves.fromJson(json['affecting_moves'])
        : null;
    affectingNatures = json['affecting_natures'] != null
        ? AffectingNatures.fromJson(json['affecting_natures'])
        : null;
    if (json['characteristics'] != null) {
      characteristics = <Characteristics>[];
      json['characteristics'].forEach((v) {
        characteristics!.add(Characteristics.fromJson(v));
      });
    }
    moveDamageClass = json['move_damage_class'] != null
        ? NamedAPIResource.fromJson(json['move_damage_class'])
        : null;
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
    data['game_index'] = gameIndex;
    data['is_battle_only'] = isBattleOnly;
    if (affectingMoves != null) {
      data['affecting_moves'] = affectingMoves!.toJson();
    }
    if (affectingNatures != null) {
      data['affecting_natures'] = affectingNatures!.toJson();
    }
    if (characteristics != null) {
      data['characteristics'] =
          characteristics!.map((v) => v.toJson()).toList();
    }
    if (moveDamageClass != null) {
      data['move_damage_class'] = moveDamageClass!.toJson();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Stat{id: $id, name: $name, gameIndex: $gameIndex, isBattleOnly: $isBattleOnly, affectingMoves: $affectingMoves, affectingNatures: $affectingNatures, characteristics: $characteristics, moveDamageClass: $moveDamageClass, names: $names}';
  }
}

class AffectingMoves {
  List<NamedAPIResource>? increase;
  List<NamedAPIResource>? decrease;

  AffectingMoves({this.increase, this.decrease});

  AffectingMoves.fromJson(Map<String, dynamic> json) {
    if (json['increase'] != null) {
      increase = <NamedAPIResource>[];
      json['increase'].forEach((v) {
        v = v['move'];
        increase!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['decrease'] != null) {
      decrease = <NamedAPIResource>[];
      json['decrease'].forEach((v) {
        v = v['move'];
        decrease!.add(NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (increase != null) {
      data['increase'] = increase!.map((v) => v.toJson()).toList();
    }
    if (decrease != null) {
      data['decrease'] = decrease!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'AffectingMoves{increase: $increase, decrease: $decrease}';
  }
}

class Increase {
  int? change;
  NamedAPIResource? move;

  Increase({this.change, this.move});

  Increase.fromJson(Map<String, dynamic> json) {
    change = json['change'];
    move = json['move'] != null
        ? NamedAPIResource.fromJson(json['move'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['change'] = change;
    if (move != null) {
      data['move'] = move!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Increase{change: $change, move: $move}';
  }
}

class Decrease {
  int? change;
  NamedAPIResource? move;

  Decrease({this.change, this.move});

  Decrease.fromJson(Map<String, dynamic> json) {
    change = json['change'];
    move = json['move'] != null
        ? NamedAPIResource.fromJson(json['move'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['change'] = change;
    if (move != null) {
      data['move'] = move!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Decrease{change: $change, move: $move}';
  }
}

class AffectingNatures {
  List<Increase>? increase;
  List<Decrease>? decrease;

  AffectingNatures({this.increase, this.decrease});

  AffectingNatures.fromJson(Map<String, dynamic> json) {
    if (json['increase'] != null) {
      increase = <Increase>[];
      json['increase'].forEach((v) {
        increase!.add(Increase.fromJson(v));
      });
    }
    if (json['decrease'] != null) {
      decrease = <Decrease>[];
      json['decrease'].forEach((v) {
        decrease!.add(Decrease.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (increase != null) {
      data['increase'] = increase!.map((v) => v.toJson()).toList();
    }
    if (decrease != null) {
      data['decrease'] = decrease!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'AffectingNatures{increase: $increase, decrease: $decrease}';
  }
}

class Characteristics {
  String? url;

  Characteristics({this.url});

  Characteristics.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }

  @override
  String toString() {
    return 'Characteristics{url: $url}';
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
