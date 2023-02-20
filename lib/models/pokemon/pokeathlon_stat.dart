import 'package:pokedexer_flutter/models/utils/common.dart';

class PokeAthlonStat {
  int? id;
  String? name;
  AffectingNatures? affectingNatures;
  List<Names>? names;

  PokeAthlonStat({this.id, this.name, this.affectingNatures, this.names});

  PokeAthlonStat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    affectingNatures = json['affecting_natures'] != null
        ? AffectingNatures.fromJson(json['affecting_natures'])
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
    if (affectingNatures != null) {
      data['affecting_natures'] = affectingNatures!.toJson();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokeAthlonStat{id: $id, name: $name, affectingNatures: $affectingNatures, names: $names}';
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

class Increase {
  int? maxChange;
  NamedAPIResource? nature;

  Increase({this.maxChange, this.nature});

  Increase.fromJson(Map<String, dynamic> json) {
    maxChange = json['max_change'];
    nature = json['nature'] != null
        ? NamedAPIResource.fromJson(json['nature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max_change'] = maxChange;
    if (nature != null) {
      data['nature'] = nature!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Increase{maxChange: $maxChange, nature: $nature}';
  }
}

class Decrease {
  int? maxChange;
  NamedAPIResource? nature;

  Decrease({this.maxChange, this.nature});

  Decrease.fromJson(Map<String, dynamic> json) {
    maxChange = json['max_change'];
    nature = json['nature'] != null
        ? NamedAPIResource.fromJson(json['nature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max_change'] = maxChange;
    if (nature != null) {
      data['nature'] = nature!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Decrease{maxChange: $maxChange, nature: $nature}';
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
