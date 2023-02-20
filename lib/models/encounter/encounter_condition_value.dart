import 'package:pokedexer_flutter/models/utils/common.dart';

class EncounterConditionValue {
  NamedAPIResource? condition;
  List<EncounterConditionValueName>? names;
  String? name;
  int? id;

  EncounterConditionValue({this.condition, this.names, this.name, this.id});

  EncounterConditionValue.fromJson(Map<String, dynamic> json) {
    condition = json['condition'] != null
        ? NamedAPIResource.fromJson(json['condition'])
        : null;
    if (json['names'] != null) {
      names = <EncounterConditionValueName>[];
      for (var v in (json['names'] as List)) {
        names!.add(EncounterConditionValueName.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'EncounterConditionValue{condition: $condition, names: $names, name: $name, id: $id}';
  }
}

class EncounterConditionValueName {
  String? name;
  NamedAPIResource? language;

  EncounterConditionValueName({this.name, this.language});

  EncounterConditionValueName.fromJson(Map<String, dynamic> json) {
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
    return 'EncounterConditionValueName{name: $name, language: $language}';
  }
}
