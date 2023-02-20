import 'package:pokedexer_flutter/models/utils/common.dart';

class PokemonForm {
  int? id;
  String? name;
  int? order;
  int? formOrder;
  bool? isDefault;
  bool? isBattleOnly;
  bool? isMega;
  String? formName;
  NamedAPIResource? pokemon;
  Sprites? sprites;
  NamedAPIResource? versionGroup;

  PokemonForm(
      {this.id,
      this.name,
      this.order,
      this.formOrder,
      this.isDefault,
      this.isBattleOnly,
      this.isMega,
      this.formName,
      this.pokemon,
      this.sprites,
      this.versionGroup});

  PokemonForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    formOrder = json['form_order'];
    isDefault = json['is_default'];
    isBattleOnly = json['is_battle_only'];
    isMega = json['is_mega'];
    formName = json['form_name'];
    pokemon = json['pokemon'] != null
        ? NamedAPIResource.fromJson(json['pokemon'])
        : null;
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    versionGroup = json['version_group'] != null
        ? NamedAPIResource.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['form_order'] = formOrder;
    data['is_default'] = isDefault;
    data['is_battle_only'] = isBattleOnly;
    data['is_mega'] = isMega;
    data['form_name'] = formName;
    if (pokemon != null) {
      data['pokemon'] = pokemon!.toJson();
    }
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokemonForm{id: $id, name: $name, order: $order, formOrder: $formOrder, isDefault: $isDefault, isBattleOnly: $isBattleOnly, isMega: $isMega, formName: $formName, pokemon: $pokemon, sprites: $sprites, versionGroup: $versionGroup}';
  }
}

class Sprites {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;

  Sprites(
      {this.backDefault, this.backShiny, this.frontDefault, this.frontShiny});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }

  @override
  String toString() {
    return 'Sprites{backDefault: $backDefault, backShiny: $backShiny, frontDefault: $frontDefault, frontShiny: $frontShiny}';
  }
}
