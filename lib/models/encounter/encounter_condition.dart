import 'package:pokedexer_flutter/models/utils/common.dart';

class EncounterCondition {
  List<EncounterConditionName>? names;
  List<NamedAPIResource>? values;
  String? name;
  int? id;

  EncounterCondition({this.names, this.values, this.name, this.id});

  EncounterCondition.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <EncounterConditionName>[];
      for (var v in (json['names'] as List)) {
        names!.add(EncounterConditionName.fromJson(v));
      }
    }
    if (json['values'] != null) {
      values = <NamedAPIResource>[];
      for (var v in (json['values'] as List)) {
        values!.add(NamedAPIResource.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'EncounterConditionEntity{names: $names, values: $values, name: $name, id: $id}';
  }
}

class EncounterConditionName {
  String? name;
  NamedAPIResource? language;

  EncounterConditionName({this.name, this.language});

  EncounterConditionName.fromJson(Map<String, dynamic> json) {
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
    return 'EncounterConditionName{name: $name, language: $language}';
  }
}
