import 'package:pokedexer_flutter/models/utils/common.dart';

class Machine {
  NamedAPIResource? item;
  NamedAPIResource? move;
  NamedAPIResource? versionGroup;
  int? id;

  Machine({this.item, this.move, this.versionGroup, this.id});

  Machine.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null
        ? NamedAPIResource.fromJson(json['item'])
        : null;
    move = json['move'] != null
        ? NamedAPIResource.fromJson(json['move'])
        : null;
    versionGroup = json['version_group'] != null
        ? NamedAPIResource.fromJson(json['version_group'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (item != null) {
      data['item'] = item!.toJson();
    }
    if (move != null) {
      data['move'] = move!.toJson();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'Machine{item: $item, move: $move, versionGroup: $versionGroup, id: $id}';
  }
}
