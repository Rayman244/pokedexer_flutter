import 'package:pokedexer_flutter/models/utils/common.dart';

class EvolutionChain {
  EvolutionChainChain? chain;
  dynamic babyTriggerItem;
  int? id;

  EvolutionChain({this.chain, this.babyTriggerItem, this.id});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    chain = json['chain'] != null
        ? EvolutionChainChain.fromJson(json['chain'])
        : null;
    babyTriggerItem = json['baby_trigger_item'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chain != null) {
      data['chain'] = chain!.toJson();
    }
    data['baby_trigger_item'] = babyTriggerItem;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return 'EvolutionChain{chain: $chain, babyTriggerItem: $babyTriggerItem, id: $id}';
  }
}

class EvolutionChainChain {
  List<NamedAPIResource>? evolutionDetails;
  NamedAPIResource? species;
  List<EvolutionChainChainEvolvesTo>? evolvesTo;
  bool? isBaby;

  EvolutionChainChain(
      {this.evolutionDetails, this.species, this.evolvesTo, this.isBaby});

  EvolutionChainChain.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails = <NamedAPIResource>[];
    }
    species = json['species'] != null
        ? NamedAPIResource.fromJson(json['species'])
        : null;
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolutionChainChainEvolvesTo>[];
      for (var v in (json['evolves_to'] as List)) {
        evolvesTo!.add(EvolutionChainChainEvolvesTo.fromJson(v));
      }
    }
    isBaby = json['is_baby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (evolutionDetails != null) {
      data['evolution_details'] = [];
    }
    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (evolvesTo != null) {
      data['evolves_to'] = evolvesTo!.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = isBaby;
    return data;
  }

  @override
  String toString() {
    return 'EvolutionChainChain{evolutionDetails: $evolutionDetails, species: $species, evolvesTo: $evolvesTo, isBaby: $isBaby}';
  }
}

class EvolutionChainChainEvolvesTo {
  List<EvolutionChainChainEvolvesToEvolutionDetail>? evolutionDetails;
  NamedAPIResource? species;
  List<EvolutionChainChainEvolvesTo>? evolvesTo;
  bool? isBaby;

  EvolutionChainChainEvolvesTo(
      {this.evolutionDetails, this.species, this.evolvesTo, this.isBaby});

  EvolutionChainChainEvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails = <EvolutionChainChainEvolvesToEvolutionDetail>[];
      for (var v in (json['evolution_details'] as List)) {
        evolutionDetails!
            .add(EvolutionChainChainEvolvesToEvolutionDetail.fromJson(v));
      }
    }
    species = json['species'] != null
        ? NamedAPIResource.fromJson(json['species'])
        : null;
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolutionChainChainEvolvesTo>[];
      for (var v in (json['evolves_to'] as List)) {
        evolvesTo!.add(EvolutionChainChainEvolvesTo.fromJson(v));
      }
    }
    isBaby = json['is_baby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (evolutionDetails != null) {
      data['evolution_details'] =
          evolutionDetails!.map((v) => v.toJson()).toList();
    }
    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (evolvesTo != null) {
      data['evolves_to'] = [];
    }
    data['is_baby'] = isBaby;
    return data;
  }

  @override
  String toString() {
    return 'EvolutionChainChainEvolvesTo{evolutionDetails: $evolutionDetails, species: $species, evolvesTo: $evolvesTo, isBaby: $isBaby}';
  }
}

class EvolutionChainChainEvolvesToEvolutionDetail {
  dynamic item;
  dynamic relativePhysicalStats;
  bool? turnUpsideDown;
  dynamic gender;
  dynamic minHappiness;
  dynamic partyType;
  dynamic heldItem;
  dynamic knownMove;
  dynamic minBeauty;
  dynamic tradeSpecies;
  NamedAPIResource? trigger;
  bool? needsOverworldRain;
  dynamic partySpecies;
  dynamic minAffection;
  dynamic knownMoveType;
  String? timeOfDay;
  dynamic location;
  int? minLevel;

  EvolutionChainChainEvolvesToEvolutionDetail(
      {this.item,
      this.relativePhysicalStats,
      this.turnUpsideDown,
      this.gender,
      this.minHappiness,
      this.partyType,
      this.heldItem,
      this.knownMove,
      this.minBeauty,
      this.tradeSpecies,
      this.trigger,
      this.needsOverworldRain,
      this.partySpecies,
      this.minAffection,
      this.knownMoveType,
      this.timeOfDay,
      this.location,
      this.minLevel});

  EvolutionChainChainEvolvesToEvolutionDetail.fromJson(
      Map<String, dynamic> json) {
    item = json['item'];
    relativePhysicalStats = json['relative_physical_stats'];
    turnUpsideDown = json['turn_upside_down'];
    gender = json['gender'];
    minHappiness = json['min_happiness'];
    partyType = json['party_type'];
    heldItem = json['held_item'];
    knownMove = json['known_move'];
    minBeauty = json['min_beauty'];
    tradeSpecies = json['trade_species'];
    trigger = json['trigger'] != null
        ? NamedAPIResource.fromJson(json['trigger'])
        : null;
    needsOverworldRain = json['needs_overworld_rain'];
    partySpecies = json['party_species'];
    minAffection = json['min_affection'];
    knownMoveType = json['known_move_type'];
    timeOfDay = json['time_of_day'];
    location = json['location'];
    minLevel = json['min_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item;
    data['relative_physical_stats'] = relativePhysicalStats;
    data['turn_upside_down'] = turnUpsideDown;
    data['gender'] = gender;
    data['min_happiness'] = minHappiness;
    data['party_type'] = partyType;
    data['held_item'] = heldItem;
    data['known_move'] = knownMove;
    data['min_beauty'] = minBeauty;
    data['trade_species'] = tradeSpecies;
    if (trigger != null) {
      data['trigger'] = trigger!.toJson();
    }
    data['needs_overworld_rain'] = needsOverworldRain;
    data['party_species'] = partySpecies;
    data['min_affection'] = minAffection;
    data['known_move_type'] = knownMoveType;
    data['time_of_day'] = timeOfDay;
    data['location'] = location;
    data['min_level'] = minLevel;
    return data;
  }

  @override
  String toString() {
    return 'EvolutionChainChainEvolvesToEvolutionDetail{item: $item, relativePhysicalStats: $relativePhysicalStats, turnUpsideDown: $turnUpsideDown, gender: $gender, minHappiness: $minHappiness, partyType: $partyType, heldItem: $heldItem, knownMove: $knownMove, minBeauty: $minBeauty, tradeSpecies: $tradeSpecies, trigger: $trigger, needsOverworldRain: $needsOverworldRain, partySpecies: $partySpecies, minAffection: $minAffection, knownMoveType: $knownMoveType, timeOfDay: $timeOfDay, location: $location, minLevel: $minLevel}';
  }
}
