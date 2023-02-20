import 'package:pokedexer_flutter/models/utils/common.dart';

class Version {
  List<VersionName>? names;
  NamedAPIResource? versionGroup;
  String? name;
  int? id;

  Version({this.names, this.versionGroup, this.name, this.id});

  Version.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <VersionName>[];
      for (var v in (json['names'] as List)) {
        names!.add(VersionName.fromJson(v));
      }
    }
    versionGroup = json['version_group'] != null
        ? NamedAPIResource.fromJson(json['version_group'])
        : null;
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    data['name'] = name;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'Version{names: $names, versionGroup: $versionGroup, name: $name, id: $id}';
  }
}

class VersionName {
  String? name;
  NamedAPIResource? language;

  VersionName({this.name, this.language});

  VersionName.fromJson(Map<String, dynamic> json) {
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
    return 'VersionName{name: $name, language: $language}';
  }
}
