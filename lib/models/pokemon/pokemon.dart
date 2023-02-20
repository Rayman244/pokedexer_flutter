import 'dart:convert';

import 'package:pokedexer_flutter/models/pokemon/egg-group.dart';
import 'package:pokedexer_flutter/models/pokemon/pokemon-specie.dart';
import 'package:pokedexer_flutter/models/utils/common.dart';
import 'package:http/http.dart' as http;

class Pokemon {
  int? id;
  String? name;
  int? baseExperience;
  int? height;
  String? origionalArtworkFrontDefault;
  bool? isDefault;
  int? order;
  int? weight;
  List<Abilities>? abilities;
  List<NamedAPIResource>? forms;
  List<GameIndices>? gameIndices;
  List<HeldItems>? heldItems;
  List<Moves>? moves;
  NamedAPIResource? apiSpecies;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;
  List<EggGroup>? eggGroup;
  PokemonSpecie? species;

  Pokemon({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.gameIndices,
    this.heldItems,
    this.moves,
    this.apiSpecies,
    this.sprites,
    this.stats,
    this.types,
    this.eggGroup,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    baseExperience = json['base_experience'];
    height = json['height'];

    isDefault = json['is_default'];
    order = json['order'];
    weight = json['weight'];
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }
    if (json['forms'] != null) {
      forms = <NamedAPIResource>[];
      json['forms'].forEach((v) {
        forms!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices = <GameIndices>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(GameIndices.fromJson(v));
      });
    }
    if (json['held_items'] != null) {
      heldItems = <HeldItems>[];
      json['held_items'].forEach((v) {
        heldItems!.add(HeldItems.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = <Moves>[];
      json['moves'].forEach((v) {
        moves!.add(Moves.fromJson(v));
      });
    }

    apiSpecies = json['species'] != null
        ? NamedAPIResource.fromJson(json['species'])
        : null;

    if (apiSpecies != null) {
      Future.delayed(Duration.zero, () async {
        var uri = Uri.parse(apiSpecies!.url!);
        var request = await http.get(uri);
  

        species = PokemonSpecie.fromJson(jsonDecode(request.body));

        for (var group in jsonDecode(request.body)["egg_groups"]) {
          eggGroup ??= [];
          eggGroup!.add(EggGroup.fromJson(group));
        }
      });
    }

    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['base_experience'] = baseExperience;
    data['height'] = height;
    data['is_default'] = isDefault;
    data['order'] = order;
    data['weight'] = weight;
    data["sprites"]["other"]["official-artwork"]["front_default"] =
        origionalArtworkFrontDefault;
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    if (forms != null) {
      data['forms'] = forms!.map((v) => v.toJson()).toList();
    }
    if (gameIndices != null) {
      data['game_indices'] = gameIndices!.map((v) => v.toJson()).toList();
    }
    if (heldItems != null) {
      data['held_items'] = heldItems!.map((v) => v.toJson()).toList();
    }
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    if (apiSpecies != null) {
      data['species'] = apiSpecies!.toJson();
    }
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name, baseExperience: $baseExperience, height: $height, isDefault: $isDefault, order: $order, weight: $weight, abilities: $abilities, forms: $forms, gameIndices: $gameIndices, heldItems: $heldItems, moves: $moves, species: $apiSpecies, sprites: $sprites, stats: $stats, types: $types}';
  }
}

class Abilities {
  bool? isHidden;
  int? slot;
  NamedAPIResource? ability;

  Abilities({this.isHidden, this.slot, this.ability});

  Abilities.fromJson(Map<String, dynamic> json) {
    isHidden = json['is_hidden'];
    slot = json['slot'];
    ability = json['ability'] != null
        ? NamedAPIResource.fromJson(json['ability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_hidden'] = isHidden;
    data['slot'] = slot;
    if (ability != null) {
      data['ability'] = ability!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Abilities{isHidden: $isHidden, slot: $slot, ability: $ability}';
  }
}

class GameIndices {
  int? gameIndex;
  NamedAPIResource? version;

  GameIndices({this.gameIndex, this.version});

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = json['version'] != null
        ? NamedAPIResource.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_index'] = gameIndex;
    if (version != null) {
      data['version'] = version!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'GameIndices{gameIndex: $gameIndex, version: $version}';
  }
}

class HeldItems {
  NamedAPIResource? item;
  List<VersionDetails>? versionDetails;

  HeldItems({this.item, this.versionDetails});

  HeldItems.fromJson(Map<String, dynamic> json) {
    item =
        json['item'] != null ? NamedAPIResource.fromJson(json['item']) : null;
    if (json['version_details'] != null) {
      versionDetails = <VersionDetails>[];
      json['version_details'].forEach((v) {
        versionDetails!.add(VersionDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (item != null) {
      data['item'] = item!.toJson();
    }
    if (versionDetails != null) {
      data['version_details'] = versionDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'HeldItems{item: $item, versionDetails: $versionDetails}';
  }
}

class VersionDetails {
  int? rarity;
  NamedAPIResource? version;

  VersionDetails({this.rarity, this.version});

  VersionDetails.fromJson(Map<String, dynamic> json) {
    rarity = json['rarity'];
    version = json['version'] != null
        ? NamedAPIResource.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rarity'] = rarity;
    if (version != null) {
      data['version'] = version!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'VersionDetails{rarity: $rarity, version: $version}';
  }
}

class EncounterDetails {
  int? minLevel;
  int? maxLevel;
  List<ConditionValues>? conditionValues;
  int? chance;
  Method? method;

  EncounterDetails(
      {this.minLevel,
      this.maxLevel,
      this.conditionValues,
      this.chance,
      this.method});

  EncounterDetails.fromJson(Map<String, dynamic> json) {
    minLevel = json['min_level'];
    maxLevel = json['max_level'];
    if (json['condition_values'] != null) {
      conditionValues = <ConditionValues>[];
      json['condition_values'].forEach((v) {
        conditionValues!.add(ConditionValues.fromJson(v));
      });
    }
    chance = json['chance'];
    method = json['method'] != null ? Method.fromJson(json['method']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_level'] = minLevel;
    data['max_level'] = maxLevel;
    if (conditionValues != null) {
      data['condition_values'] =
          conditionValues!.map((v) => v.toJson()).toList();
    }
    data['chance'] = chance;
    if (method != null) {
      data['method'] = method!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'EncounterDetails{minLevel: $minLevel, maxLevel: $maxLevel, conditionValues: $conditionValues, chance: $chance, method: $method}';
  }
}

class ConditionValues {
  String? name;
  String? url;

  ConditionValues({this.name, this.url});

  ConditionValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  @override
  String toString() {
    return 'ConditionValues{name: $name, url: $url}';
  }
}

class Method {
  String? name;
  String? url;

  Method({this.name, this.url});

  Method.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  @override
  String toString() {
    return 'Method{name: $name, url: $url}';
  }
}

class Moves {
  NamedAPIResource? move;
  List<VersionGroupDetails>? versionGroupDetails;

  Moves({this.move, this.versionGroupDetails});

  Moves.fromJson(Map<String, dynamic> json) {
    move =
        json['move'] != null ? NamedAPIResource.fromJson(json['move']) : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetails>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(VersionGroupDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (move != null) {
      data['move'] = move!.toJson();
    }
    if (versionGroupDetails != null) {
      data['version_group_details'] =
          versionGroupDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Moves{move: $move, versionGroupDetails: $versionGroupDetails}';
  }
}

class VersionGroupDetails {
  int? levelLearnedAt;
  NamedAPIResource? versionGroup;
  NamedAPIResource? moveLearnMethod;

  VersionGroupDetails(
      {this.levelLearnedAt, this.versionGroup, this.moveLearnMethod});

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    versionGroup = json['version_group'] != null
        ? NamedAPIResource.fromJson(json['version_group'])
        : null;
    moveLearnMethod = json['move_learn_method'] != null
        ? NamedAPIResource.fromJson(json['move_learn_method'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level_learned_at'] = levelLearnedAt;
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    if (moveLearnMethod != null) {
      data['move_learn_method'] = moveLearnMethod!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'VersionGroupDetails{levelLearnedAt: $levelLearnedAt, versionGroup: $versionGroup, moveLearnMethod: $moveLearnMethod}';
  }
}

class Sprites {
  String? backFemale;
  String? backShinyFemale;
  String? backDefault;
  String? frontFemale;
  String? frontShinyFemale;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? origionalArtworkFrontDefault;

  Sprites({
    this.backFemale,
    this.backShinyFemale,
    this.backDefault,
    this.frontFemale,
    this.frontShinyFemale,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.origionalArtworkFrontDefault,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    backFemale = json['back_female'];
    backShinyFemale = json['back_shiny_female'];
    backDefault = json['back_default'];
    frontFemale = json['front_female'];
    frontShinyFemale = json['front_shiny_female'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
    origionalArtworkFrontDefault =
        json["other"]["official-artwork"]["front_default"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_female'] = backFemale;
    data['back_shiny_female'] = backShinyFemale;
    data['back_default'] = backDefault;
    data['front_female'] = frontFemale;
    data['front_shiny_female'] = frontShinyFemale;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }

  @override
  String toString() {
    return 'Sprites{backFemale: $backFemale, backShinyFemale: $backShinyFemale, backDefault: $backDefault, frontFemale: $frontFemale, frontShinyFemale: $frontShinyFemale, backShiny: $backShiny, frontDefault: $frontDefault, frontShiny: $frontShiny} origionalArtworkFrontDefault: $origionalArtworkFrontDefault}';
  }
}

class Stats {
  int? baseStat;
  int? effort;
  NamedAPIResource? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat =
        json['stat'] != null ? NamedAPIResource.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Stats{baseStat: $baseStat, effort: $effort, stat: $stat}';
  }
}

class Types {
  int? slot;
  NamedAPIResource? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type =
        json['type'] != null ? NamedAPIResource.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Types{slot: $slot, type: $type}';
  }
}
