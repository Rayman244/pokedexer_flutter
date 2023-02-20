import 'package:pokedexer_flutter/models/utils/common.dart';

class Move {
  NamedAPIResource? generation;
  int? pp;
  List<NamedAPIResource>? statChanges;
  int? accuracy;
  MoveContestCombos? contestCombos;
  int? priority;
  NamedAPIResource? superContestEffect;
  NamedAPIResource? type;
  List<NamedAPIResource>? effectChanges;
  NamedAPIResource? target;
  List<MoveEffectEntry>? effectEntries;
  NamedAPIResource? contestType;
  List<NamedAPIResource>? pastValues;
  List<MoveName>? names;
  MoveMeta? meta;
  List<MoveFlavorTextEntry>? flavorTextEntries;
  NamedAPIResource? damageClass;
  String? name;
  dynamic effectChance;
  int? id;
  List<NamedAPIResource>? machines;
  int? power;
  NamedAPIResource? contestEffect;

  Move(
      {this.generation,
      this.pp,
      this.statChanges,
      this.accuracy,
      this.contestCombos,
      this.priority,
      this.superContestEffect,
      this.type,
      this.effectChanges,
      this.target,
      this.effectEntries,
      this.contestType,
      this.pastValues,
      this.names,
      this.meta,
      this.flavorTextEntries,
      this.damageClass,
      this.name,
      this.effectChance,
      this.id,
      this.machines,
      this.power,
      this.contestEffect});

  Move.fromJson(Map<String, dynamic> json) {
    generation = json['generation'] != null
        ? NamedAPIResource.fromJson(json['generation'])
        : null;
    pp = json['pp'];
    if (json['stat_changes'] != null) {
      statChanges = <NamedAPIResource>[];
    }
    accuracy = json['accuracy'];
    contestCombos = json['contest_combos'] != null
        ? MoveContestCombos.fromJson(json['contest_combos'])
        : null;
    priority = json['priority'];
    superContestEffect = json['super_contest_effect'] != null
        ? NamedAPIResource.fromJson(json['super_contest_effect'])
        : null;
    type =
        json['type'] != null ? NamedAPIResource.fromJson(json['type']) : null;
    if (json['effect_changes'] != null) {
      effectChanges = <NamedAPIResource>[];
    }
    target = json['target'] != null
        ? NamedAPIResource.fromJson(json['target'])
        : null;
    if (json['effect_entries'] != null) {
      effectEntries = <MoveEffectEntry>[];
      for (var v in (json['effect_entries'] as List)) {
        effectEntries!.add(MoveEffectEntry.fromJson(v));
      }
    }
    contestType = json['contest_type'] != null
        ? NamedAPIResource.fromJson(json['contest_type'])
        : null;
    if (json['past_values'] != null) {
      pastValues = <NamedAPIResource>[];
    }
    if (json['names'] != null) {
      names = <MoveName>[];
      for (var v in (json['names'] as List)) {
        names!.add(MoveName.fromJson(v));
      }
    }
    meta = json['meta'] != null ? MoveMeta.fromJson(json['meta']) : null;
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <MoveFlavorTextEntry>[];
      for (var v in (json['flavor_text_entries'] as List)) {
        flavorTextEntries!.add(MoveFlavorTextEntry.fromJson(v));
      }
    }
    damageClass = json['damage_class'] != null
        ? NamedAPIResource.fromJson(json['damage_class'])
        : null;
    name = json['name'];
    effectChance = json['effect_chance'];
    id = json['id'];
    if (json['machines'] != null) {
      machines = <NamedAPIResource>[];
    }
    power = json['power'];
    contestEffect = json['contest_effect'] != null
        ? NamedAPIResource.fromJson(json['contest_effect'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (generation != null) {
      data['generation'] = generation!.toJson();
    }
    data['pp'] = pp;
    if (statChanges != null) {
      data['stat_changes'] = [];
    }
    data['accuracy'] = accuracy;
    if (contestCombos != null) {
      data['contest_combos'] = contestCombos!.toJson();
    }
    data['priority'] = priority;
    if (superContestEffect != null) {
      data['super_contest_effect'] = superContestEffect!.toJson();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (effectChanges != null) {
      data['effect_changes'] = [];
    }
    if (target != null) {
      data['target'] = target!.toJson();
    }
    if (effectEntries != null) {
      data['effect_entries'] =
          effectEntries!.map((v) => v.toJson()).toList();
    }
    if (contestType != null) {
      data['contest_type'] = contestType!.toJson();
    }
    if (pastValues != null) {
      data['past_values'] = [];
    }
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (flavorTextEntries != null) {
      data['flavor_text_entries'] =
          flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    if (damageClass != null) {
      data['damage_class'] = damageClass!.toJson();
    }
    data['name'] = name;
    data['effect_chance'] = effectChance;
    data['id'] = id;
    if (machines != null) {
      data['machines'] = [];
    }
    data['power'] = power;
    if (contestEffect != null) {
      data['contest_effect'] = contestEffect!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Move{generation: $generation, pp: $pp, statChanges: $statChanges, accuracy: $accuracy, contestCombos: $contestCombos, priority: $priority, superContestEffect: $superContestEffect, type: $type, effectChanges: $effectChanges, target: $target, effectEntries: $effectEntries, contestType: $contestType, pastValues: $pastValues, names: $names, meta: $meta, flavorTextEntries: $flavorTextEntries, damageClass: $damageClass, name: $name, effectChance: $effectChance, id: $id, machines: $machines, power: $power, contestEffect: $contestEffect}';
  }
}

class MoveContestCombos {
  MoveContestCombosSuper? xSuper;
  MoveContestCombosNormal? normal;

  MoveContestCombos({this.xSuper, this.normal});

  MoveContestCombos.fromJson(Map<String, dynamic> json) {
    xSuper = json['super'] != null
        ? MoveContestCombosSuper.fromJson(json['super'])
        : null;
    normal = json['normal'] != null
        ? MoveContestCombosNormal.fromJson(json['normal'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (xSuper != null) {
      data['super'] = xSuper!.toJson();
    }
    if (normal != null) {
      data['normal'] = normal!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveContestCombos{xSuper: $xSuper, normal: $normal}';
  }
}

class MoveContestCombosSuper {
  dynamic useAfter;
  dynamic useBefore;

  MoveContestCombosSuper({this.useAfter, this.useBefore});

  MoveContestCombosSuper.fromJson(Map<String, dynamic> json) {
    useAfter = json['use_after'];
    useBefore = json['use_before'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['use_after'] = useAfter;
    data['use_before'] = useBefore;
    return data;
  }

  @override
  String toString() {
    return 'MoveContestCombosSuper{useAfter: $useAfter, useBefore: $useBefore}';
  }
}

class MoveContestCombosNormal {
  dynamic useAfter;
  List<NamedAPIResource>? useBefore;

  MoveContestCombosNormal({this.useAfter, this.useBefore});

  MoveContestCombosNormal.fromJson(Map<String, dynamic> json) {
    useAfter = json['use_after'];
    if (json['use_before'] != null) {
      useBefore = <NamedAPIResource>[];
      for (var v in (json['use_before'] as List)) {
        useBefore!.add(NamedAPIResource.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['use_after'] = useAfter;
    if (useBefore != null) {
      data['use_before'] = useBefore!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveContestCombosNormal{useAfter: $useAfter, useBefore: $useBefore}';
  }
}

class MoveEffectEntry {
  String? shortEffect;
  String? effect;
  NamedAPIResource? language;

  MoveEffectEntry({this.shortEffect, this.effect, this.language});

  MoveEffectEntry.fromJson(Map<String, dynamic> json) {
    shortEffect = json['short_effect'];
    effect = json['effect'];
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['short_effect'] = shortEffect;
    data['effect'] = effect;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveEffectEntry{shortEffect: $shortEffect, effect: $effect, language: $language}';
  }
}

class MoveName {
  String? name;
  NamedAPIResource? language;

  MoveName({this.name, this.language});

  MoveName.fromJson(Map<String, dynamic> json) {
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
    return 'MoveName{name: $name, language: $language}';
  }
}

class MoveMeta {
  int? healing;
  dynamic minHits;
  dynamic maxHits;
  int? ailmentChance;
  int? critRate;
  int? flinchChance;
  dynamic minTurns;
  NamedAPIResource? ailment;
  NamedAPIResource? category;
  dynamic maxTurns;
  int? drain;
  int? statChance;

  MoveMeta(
      {this.healing,
      this.minHits,
      this.maxHits,
      this.ailmentChance,
      this.critRate,
      this.flinchChance,
      this.minTurns,
      this.ailment,
      this.category,
      this.maxTurns,
      this.drain,
      this.statChance});

  MoveMeta.fromJson(Map<String, dynamic> json) {
    healing = json['healing'];
    minHits = json['min_hits'];
    maxHits = json['max_hits'];
    ailmentChance = json['ailment_chance'];
    critRate = json['crit_rate'];
    flinchChance = json['flinch_chance'];
    minTurns = json['min_turns'];
    ailment = json['ailment'] != null
        ? NamedAPIResource.fromJson(json['ailment'])
        : null;
    category = json['category'] != null
        ? NamedAPIResource.fromJson(json['category'])
        : null;
    maxTurns = json['max_turns'];
    drain = json['drain'];
    statChance = json['stat_chance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['healing'] = healing;
    data['min_hits'] = minHits;
    data['max_hits'] = maxHits;
    data['ailment_chance'] = ailmentChance;
    data['crit_rate'] = critRate;
    data['flinch_chance'] = flinchChance;
    data['min_turns'] = minTurns;
    if (ailment != null) {
      data['ailment'] = ailment!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['max_turns'] = maxTurns;
    data['drain'] = drain;
    data['stat_chance'] = statChance;
    return data;
  }

  @override
  String toString() {
    return 'MoveMeta{healing: $healing, minHits: $minHits, maxHits: $maxHits, ailmentChance: $ailmentChance, critRate: $critRate, flinchChance: $flinchChance, minTurns: $minTurns, ailment: $ailment, category: $category, maxTurns: $maxTurns, drain: $drain, statChance: $statChance}';
  }
}

class MoveFlavorTextEntry {
  NamedAPIResource? versionGroup;
  NamedAPIResource? language;
  String? flavorText;

  MoveFlavorTextEntry({this.versionGroup, this.language, this.flavorText});

  MoveFlavorTextEntry.fromJson(Map<String, dynamic> json) {
    versionGroup = json['version_group'] != null
        ? NamedAPIResource.fromJson(json['version_group'])
        : null;
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
    flavorText = json['flavor_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    if (language != null) {
      data['language'] = language!.toJson();
    }
    data['flavor_text'] = flavorText;
    return data;
  }

  @override
  String toString() {
    return 'MoveFlavorTextEntry{versionGroup: $versionGroup, language: $language, flavorText: $flavorText}';
  }
}
