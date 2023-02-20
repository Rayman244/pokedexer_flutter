import 'package:pokedexer_flutter/models/utils/common.dart';

class Berry {
  NamedAPIResource? firmness;
  List<Flavors>? flavors;
  int? growthTime;
  int? id;
  NamedAPIResource? item;
  int? maxHarvest;
  String? name;
  int? naturalGiftPower;
  NamedAPIResource? naturalGiftType;
  int? size;
  int? smoothness;
  int? soilDryness;

  Berry(
      {this.firmness,
      this.flavors,
      this.growthTime,
      this.id,
      this.item,
      this.maxHarvest,
      this.name,
      this.naturalGiftPower,
      this.naturalGiftType,
      this.size,
      this.smoothness,
      this.soilDryness});

  Berry.fromJson(Map<String, dynamic> json) {
    firmness = json['firmness'] != null
        ?  NamedAPIResource.fromJson(json['firmness'])
        : null;
    if (json['flavors'] != null) {
      flavors =  <Flavors>[];
      json['flavors'].forEach((v) {
        flavors!.add( Flavors.fromJson(v));
      });
    }
    growthTime = json['growth_time'];
    id = json['id'];
    item = json['item'] != null
        ?  NamedAPIResource.fromJson(json['item'])
        : null;
    maxHarvest = json['max_harvest'];
    name = json['name'];
    naturalGiftPower = json['natural_gift_power'];
    naturalGiftType = json['natural_gift_type'] != null
        ?  NamedAPIResource.fromJson(json['natural_gift_type'])
        : null;
    size = json['size'];
    smoothness = json['smoothness'];
    soilDryness = json['soil_dryness'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (firmness != null) {
      data['firmness'] = firmness!.toJson();
    }
    if (flavors != null) {
      data['flavors'] = flavors!.map((v) => v.toJson()).toList();
    }
    data['growth_time'] = growthTime;
    data['id'] = id;
    if (item != null) {
      data['item'] = item!.toJson();
    }
    data['max_harvest'] = maxHarvest;
    data['name'] = name;
    data['natural_gift_power'] = naturalGiftPower;
    if (naturalGiftType != null) {
      data['natural_gift_type'] = naturalGiftType!.toJson();
    }
    data['size'] = size;
    data['smoothness'] = smoothness;
    data['soil_dryness'] = soilDryness;
    return data;
  }

  @override
  String toString() {
    return 'Berry{firmness: $firmness, flavors: $flavors, growthTime: $growthTime, id: $id, item: $item, maxHarvest: $maxHarvest, name: $name, naturalGiftPower: $naturalGiftPower, naturalGiftType: $naturalGiftType, size: $size, smoothness: $smoothness, soilDryness: $soilDryness}';
  }
}

class Flavors {
  NamedAPIResource? flavor;
  int? potency;

  Flavors({this.flavor, this.potency});

  Flavors.fromJson(Map<String, dynamic> json) {
    flavor = json['flavor'] != null
        ?  NamedAPIResource.fromJson(json['flavor'])
        : null;
    potency = json['potency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (flavor != null) {
      data['flavor'] = flavor!.toJson();
    }
    data['potency'] = potency;
    return data;
  }

  @override
  String toString() {
    return 'Flavors{flavor: $flavor, potency: $potency}';
  }
}
