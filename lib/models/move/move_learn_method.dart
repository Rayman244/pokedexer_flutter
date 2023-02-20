import 'package:pokedexer_flutter/models/utils/common.dart';

class MoveLearnMethod {
  List<MoveLearnMethodName>? names;
  List<NamedAPIResource>? versionGroups;
  String? name;
  int? id;
  List<MoveLearnMethodDescription>? descriptions;

  MoveLearnMethod(
      {this.names, this.versionGroups, this.name, this.id, this.descriptions});

  MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <MoveLearnMethodName>[];
      for (var v in (json['names'] as List)) {
        names!.add(MoveLearnMethodName.fromJson(v));
      }
    }
    if (json['version_groups'] != null) {
      versionGroups = <NamedAPIResource>[];
      for (var v in (json['version_groups'] as List)) {
        versionGroups!.add(NamedAPIResource.fromJson(v));
      }
    }
    name = json['name'];
    id = json['id'];
    if (json['descriptions'] != null) {
      descriptions = <MoveLearnMethodDescription>[];
      for (var v in (json['descriptions'] as List)) {
        descriptions!.add(MoveLearnMethodDescription.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (versionGroups != null) {
      data['version_groups'] =
          versionGroups!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    if (descriptions != null) {
      data['descriptions'] = descriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveLearnMethod{names: $names, versionGroups: $versionGroups, name: $name, id: $id, descriptions: $descriptions}';
  }
}

class MoveLearnMethodName {
  String? name;
  NamedAPIResource? language;

  MoveLearnMethodName({this.name, this.language});

  MoveLearnMethodName.fromJson(Map<String, dynamic> json) {
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
    return 'MoveLearnMethodName{name: $name, language: $language}';
  }
}

class MoveLearnMethodDescription {
  String? description;
  NamedAPIResource? language;

  MoveLearnMethodDescription({this.description, this.language});

  MoveLearnMethodDescription.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveLearnMethodDescription{description: $description, language: $language}';
  }
}
